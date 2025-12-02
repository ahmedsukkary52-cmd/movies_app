import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/logic/API/search_api/search_api_manager.dart';
import 'package:team_flutter_6_movie_app/ui/home/movie_item.dart';

import '../../logic/API/movies_list_api/movies_model/movies_model.dart';

class SearchItem extends StatefulWidget {
  String searchText;

  SearchItem({super.key, required this.searchText});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
      future: SearchApiManager.getSearch(widget.searchText),
      builder: (context, snapshot) {
        //todo loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: ColorApp.primaryBlack,
              color: ColorApp.whiteColor,
            ),
          );
          //todo error from client
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something went wrong.", style: TextApp.regular20White),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.whiteColor,
                ),
                onPressed: () {
                  SearchApiManager.getSearch(widget.searchText);
                  setState(() {});
                },
                child: Text("Try Again", style: TextApp.regular20black),
              ),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  snapshot.data!.statusMessage!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: context.height * 0.02),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.whiteColor,
                  ),
                  onPressed: () {
                    SearchApiManager.getSearch(widget.searchText);
                    setState(() {});
                  },
                  child: Text("Try Again", style: TextApp.regular20black),
                ),
              ],
            ),
          );
        }
        var listMovies = snapshot.data!.data?.movies ?? [];
        return listMovies.isEmpty
            ? Center(
                child: Image.asset(
                  PathImage.emptyImage,
                  height: context.height * 0.13,
                  width: context.width * 0.28,
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.only(top: context.height * 0.02),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //todo Navigator to movies details Screen
                    },
                    child: MovieItem(movie: listMovies[index]),
                  );
                },
                itemCount: listMovies.length,
              );
      },
    );
  }
}
