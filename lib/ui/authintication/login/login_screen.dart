import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

import '../../../l10n/app_localizations.dart';
import '../../home/home_screen.dart';
import '../register/register_screen.dart';
import '../rusable_widget/custom_elevated_button.dart';
import '../rusable_widget/custom_text_field.dart';
import '../rusable_widget/toggle_switchs.dart';

var formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  PathImage.splashLogo,
                  height: context.height * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: context.height* 0.02),
                CustomTextField(
                  prefixIconName: PathImage.email,
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_email;
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_valid_email;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.02),
                CustomTextField(
                  hasSuffix: true,
                  obsecureText: true,
                  prefixIconName: PathImage.password,
                  hintText: AppLocalizations.of(context)!.password,
                  controller: passwardController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_password;
                    }
                    if (text.length < 6) {
                      return AppLocalizations.of(
                        context,
                      )!.password_too_short;
                    }
                    return null;
                  },
                ),
                SizedBox(height:context.height* 0.01),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: TextApp.regular14Wallow,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.02),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: login,
                ),
                SizedBox(height:context.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dont_have_account,
                      style: TextApp.regular16White,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.create_account,
                        style: TextApp.regular14Wallow,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.01),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorApp.primaryWallow,
                        indent: context.width * 0.2,
                        endIndent: context.width * 0.02,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: TextApp.regular14Wallow,
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorApp.primaryWallow,
                        indent: context.width * 0.02,
                        endIndent: context.width * 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.02),
                CustomElevatedButton(
                  hasIcon: true,
                  text: AppLocalizations.of(context)!.login_with_google,
                  onPressed: () {},
                ),
                SizedBox(height: context.height * 0.04),
                ToggleSwitch(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    }
  }
}
