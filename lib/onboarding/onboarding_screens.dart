import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/onboarding/reusable_widget/build_footer.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int currentIndex = 0;
  final introKey = GlobalKey<IntroductionScreenState>();

  final PageDecoration pageDecoration = const PageDecoration(
    pageMargin: EdgeInsets.zero,
    safeArea: 0,
    footerFlex: 0,
    footerPadding: EdgeInsets.zero,
  );

  Text body(String bodyString) {
    return Text(
      bodyString,
      style: TextApp.regular20White,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations local = AppLocalizations.of(context)!;

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: IntroductionScreen(
        key: introKey,

        curve: Curves.easeInOutCubic,
        animationDuration: 600,
        globalBackgroundColor: ColorApp.primaryBlack,

        onChange: (index) {
          currentIndex = index;
          setState(() {});
        },

        showDoneButton: false,
        showBackButton: false,
        showNextButton: false,
        showSkipButton: false,
        showBottomPart: false,

        pages: [
          PageViewModel(
            decoration: PageDecoration(
              safeArea: context.height * .025,
              footerFlex: 0,
              bodyFlex: 0,
            ),
            footer: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * .04,
                vertical: context.height * .01,
              ),
              child: CustomElevatedButton(text: local.explore_now, onPressed: next,textStyle: TextApp.semiBold20black)
            ),
            backgroundImage: PathImage.onboarding1,
            titleWidget: Text(
              local.find_favorite_movie,
              style: TextApp.medium36White,
              textAlign: TextAlign.center,
            ),
            bodyWidget: body(local.get_access_huge),
          ),
          PageViewModel(
            backgroundImage: PathImage.onboarding2,
            title: '',
            body: '',
            decoration: pageDecoration,
            footer: BuildFooter(
              onPressed: next,
              context: context,
              local: local,
              haveBack: false,
              titleString: local.discover_movies,
              bodyString: local.explore_vast,
            ),
          ),
          PageViewModel(
            backgroundImage: PathImage.onboarding3,
            title: '',
            body: '',
            decoration: pageDecoration,
            footer: BuildFooter(
              onPressed: next,
              onBack: back,
              context: context,
              local: local,
              haveBack: true,
              titleString: local.explore_all_genres,
              bodyString: local.discover_movies_from_genre,
            ),
          ),
          PageViewModel(
            backgroundImage: PathImage.onboarding4,
            title: '',
            body: '',
            decoration: pageDecoration,
            footer: BuildFooter(
              onPressed: next,
              onBack: back,
              context: context,
              local: local,
              haveBack: true,
              titleString: local.create_watchlist,
              bodyString: local.share_thoughts,
              height: .4,
            ),
          ),
          PageViewModel(
            backgroundImage: PathImage.onboarding5,
            title: '',
            body: '',
            decoration: pageDecoration,
            footer: BuildFooter(
              onPressed: next,
              onBack: back,
              context: context,
              local: local,
              haveBack: true,
              titleString: local.rate_review_learn,
              bodyString: local.share_thoughts,
              height: .4,
            ),
          ),
          PageViewModel(
            backgroundImage: PathImage.onboarding6,
            title: '',
            body: '',
            decoration: pageDecoration,
            footer: BuildFooter(
              onBack: back,
              onPressed: onFinish,
              context: context,
              local: local,
              haveBack: true,
              elevated: local.finish,
              titleString: local.start_watching,
              bodyString: '',
              isLastPage: true,
              height: .25,
            ),
          ),
        ],
      ),
    );
  }

  void next() => introKey.currentState?.next();

  void back() => introKey.currentState?.previous();

  void onFinish() => Navigator.pushReplacementNamed(context, RoutesApp.loginRouteName);
}
