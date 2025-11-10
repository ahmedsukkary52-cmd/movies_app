import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:team_flutter_6_movie_app/Bloc/local_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/app_theme.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/login/login_screen.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/register/register_screen.dart';
import 'package:team_flutter_6_movie_app/ui/home/home_screen.dart';
import 'package:team_flutter_6_movie_app/ui/reset_password_widget/forget_password_screen.dart';
import 'package:team_flutter_6_movie_app/ui/reset_password_widget/reset_passsword_screen.dart';
import 'package:team_flutter_6_movie_app/ui/update_Profile/update_profile.dart';

import 'Bloc/local_state.dart';
import 'cubit/select_index_avatars_cubit.dart';
import 'l10n/app_localizations.dart';
import 'onboarding/onboarding_screens.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleBloc()),
        BlocProvider(create: (context) => SelectIndexAvatarsCubit()),
      ],
      child: MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesApp.onboardingRouteName,
          routes: {
            RoutesApp.loginRouteName: (context) => LoginScreen(),
            RoutesApp.homeRouteName: (context) => HomeScreen() ,
            RoutesApp.registerRouteName: (context) => RegisterScreen(),
            RoutesApp.onboardingRouteName: (context) => OnboardingScreens(),
            RoutesApp.updateProfileRouteName: (context) => UpdateProfile(),
            RoutesApp.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
            RoutesApp.resetPasswordScreen: (context) => ResetPassswordScreen(),
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ar')],
          locale: state.locale,
          theme: AppTheme.themeData,
        );
      },
    );
  }
}
