import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/logic/API/movie_details_api/movie_details_api_manager/movie_details_api_controller.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_controller.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_model/suggestions_model.dart'
    hide Movies;
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/cast_item.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/category_screen_shots.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/rate_widget.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/similar_movie_item.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/text_app.dart';
import '../../logic/API/movie_details_api/movie_details_model/movie_details_model.dart';
import '../../logic/API/movies_list_api/movies_model/movies_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Future<List<dynamic>>? combinedFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)?.settings.arguments;

    int movieId = 0;

    if (arg is int) {
      movieId = arg;
    } else if (arg is Movies) {
      movieId = arg.id ?? 0;
    } else {
      movieId = 0;
    }

    combinedFuture = Future.wait([
      MovieDetailsApiController().fetchDetails(movieId: movieId),
      SuggestionsController().fetchSuggestions(movieId: movieId),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder<List<dynamic>>(
          future: combinedFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            final detailsResponse = snapshot.data?[0] as MovieDetailsResponse?;
            final suggestionsResponse = snapshot.data?[1] as SuggestionsResponse?;

            if (detailsResponse == null ||
                detailsResponse.data?.movie == null) {
              return Center(child: Text("No details API available",style: TextApp.regular20White,));
            }else if(suggestionsResponse == null ||
                suggestionsResponse.data?.movies == null){
              return Center(child: Text("No  suggestions API available",style: TextApp.regular20White,));
            }
            return buildDetailsUi(detailsResponse, suggestionsResponse);
          },
        ),
      ),
    );
  }

  Widget buildDetailsUi(
    MovieDetailsResponse details,
    SuggestionsResponse suggestions,
  ) {
    final movieDetails = details.data?.movie;
    final screenshots = movieDetails?.largeScreenshots ?? [];
    final castList = movieDetails?.cast ?? [];
    final similarMovies = suggestions.data?.movies ?? [];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: context.height * .7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: movieDetails?.largeCoverImage != null
                    ? CachedNetworkImageProvider(movieDetails!.largeCoverImage!)
                    : const AssetImage(PathImage.emptyImage) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: AlignmentGeometry.topCenter,
                  begin: AlignmentGeometry.bottomCenter,
                  colors: [
                    ColorApp.primaryBlack,
                    ColorApp.transparentBlack,
                    ColorApp.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: context.width*.04,
                    right: context.width*.04,
                    top: context.height*.04,
                    bottom: context.height*.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 30,
                            color: ColorApp.whiteColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              PathImage.bookmark,
                              width: context.width * 0.06,
                              height: context.height * 0.06,
                            ),
                          ),
                        ],
                      ),
                    InkWell(
                      onTap: () {
                        openMovieUrl(movieDetails?.url ?? '');
                      },
                      child: Image.asset(
                        PathImage.startMoveButton,
                        height: context.height * 0.1,
                      ),
                    ),
                    Column(children: [
                      Text(
                        movieDetails?.title ?? 'No Title',
                        style: TextApp.bold24White,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: context.height * 0.02),
                      Text(
                        '${movieDetails?.year ?? "----"}',
                        style: TextApp.bold20Gray,
                      ),
                    ],)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomElevatedButton(
                  textStyle: TextApp.bold20White,
                  background: ColorApp.redColor,
                  text: AppLocalizations.of(context)!.watch,
                  onPressed: () {
                    openMovieUrl(movieDetails?.url ?? '');
                  },
                ),
                SizedBox(height: context.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RateWidget(
                      imageName: PathImage.favorite,
                      rateNumber: movieDetails?.likeCount ?? 0,
                    ),
                    RateWidget(
                      imageName: PathImage.clock,
                      rateNumber: movieDetails?.runtime ?? 0,
                    ),
                    RateWidget(
                      imageName: PathImage.star,
                      rateNumber: movieDetails?.rating ?? 0,
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.02),
                Text("Screen Shots", style: TextApp.bold24White),
                SizedBox(height: context.height * 0.02),
                screenshots.isEmpty
                    ? Center(
                        child: Text(
                          "No screenshots available",
                          style: TextApp.regular16White,
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsetsGeometry.zero,
                        itemBuilder: (context, index) => CategoryScreenShots(
                          screenShotImage: screenshots[index],
                        ),
                        separatorBuilder: (_, __) =>
                            SizedBox(height: context.height * 0.03),
                        itemCount: screenshots.length,
                      ),
                SizedBox(height: context.height * 0.03),
                Text("Similar", style: TextApp.bold24White),
                SizedBox(height: context.height * 0.02),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height * .3,
                    crossAxisSpacing: context.width * .04,
                    mainAxisSpacing: context.width * .04,
                  ),
                  itemCount: similarMovies.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesApp.movieDetails,
                        arguments: similarMovies[index].id,
                      );
                    },
                    child: SuggestionsMovieItem(movie: similarMovies[index]),
                  ),
                ),

                SizedBox(height: context.height * 0.03),
                Text("Summary", style: TextApp.bold24White),
                SizedBox(height: context.height * 0.02),
                Text(
                  ifNull(movieDetails?.descriptionIntro, 'Summary'),
                  style: TextApp.regular16White,
                ),
                SizedBox(height: context.height * 0.03),
                Text("Cast", style: TextApp.bold24White),
                SizedBox(height: context.height * 0.02),
                castList.isEmpty
                    ? Text(
                        "No Cast Available Now",
                        style: TextApp.regular16White,
                      )
                    : ListView.separated(
                        padding: EdgeInsetsGeometry.only(
                          bottom: context.height * .02,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final cast = castList[index];
                          return CastItem(
                            castImage: cast.urlSmallImage ?? "",
                            castCharacter: cast.characterName ?? "",
                            castName: cast.name ?? "",
                          );
                        },
                        separatorBuilder: (_, __) =>
                            SizedBox(height: context.height * 0.01),
                        itemCount: castList.length,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openMovieUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print("Error opening URL: $e");
    }
  }

  String ifNull(String? apiText, String text) {
    if (apiText == "" || apiText == null) {
      return "Sorry, $text Not Available Now ";
    }
    return apiText;
  }
}
