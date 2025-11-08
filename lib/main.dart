import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:team_flutter_6_movie_app/Bloc/local_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/ui/reset_password_widget/forget_password_screen.dart';
import 'package:team_flutter_6_movie_app/ui/reset_password_widget/reset_passsword_screen.dart';
import 'Bloc/local_state.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
      BlocProvider(create: (context) => LocaleBloc(), child: MoviesApp()));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:RoutesApp.forgetPasswordScreen,
           // RoutesApp.loginRouteName,
          routes: {
            RoutesApp.loginRouteName: (context) => Login(),
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
        );
      },
    );
  }
}
