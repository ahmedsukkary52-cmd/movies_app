import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';

import '../../Utils/assets_app.dart';
import '../../Utils/color_App.dart';
import '../../Utils/text_app.dart';
import '../../Utils/user_session_token.dart';
import '../../l10n/app_localizations.dart';
import '../../logic/API/auth_api/auth_api_manager/reset_password_api_manager/reset_password_api_manager.dart';
import '../authintication/rusable_widget/custom_text_field.dart';

class ResetPassswordScreen extends StatefulWidget {
  ResetPassswordScreen({super.key});

  @override
  State<ResetPassswordScreen> createState() => _ResetPassswordScreenState();
}

class _ResetPassswordScreenState extends State<ResetPassswordScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController checkPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: ColorApp.primaryWallow),
        backgroundColor: ColorApp.primaryBlack,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forget_password,
          style: TextApp.regular16Wallow,
        ),
      ),
      backgroundColor: ColorApp.primaryBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
          vertical: context.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  child: Image(image: AssetImage(PathImage.forgetPassword)),
                ),
                SizedBox(height: context.height * 0.02),
                CustomTextField(
                  prefixIconName: Icon(Icons.lock, color: ColorApp.whiteColor),
                  hintText: AppLocalizations.of(context)!.old_pass,
                  controller: oldPassController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_password;
                    }
                    return null;
                  },
                  hasSuffix: true,
                  obsecureText: true,
                ),
                SizedBox(height: context.height * 0.02),
                CustomTextField(
                  prefixIconName: Icon(Icons.lock, color: ColorApp.whiteColor),
                  hintText: AppLocalizations.of(context)!.new_pass,
                  controller: newPassController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_password;
                    }
                    if (text.length < 6) {
                      return AppLocalizations.of(context)!.password_too_short;
                    }
                    return null;
                  },
                  hasSuffix: true,
                  obsecureText: true,
                ),
                SizedBox(height: context.height * 0.02),
                CustomTextField(
                  prefixIconName: Icon(Icons.password, color: ColorApp.whiteColor),
                  hintText: AppLocalizations.of(context)!.new_pass,
                  controller: checkPassController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_password;
                    }
                    if (text != newPassController.text) {
                      return AppLocalizations.of(context)!.password_not_match;
                    }
                    return null;
                  },
                  hasSuffix: true,
                  obsecureText: true,
                ),
                SizedBox(height: context.height * 0.02),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.reset_password,
                  onPressed: () {
                    checkPass(context, oldPassController.text, newPassController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkPass(BuildContext context, String oldPass, String newPass) async {
    if (formKey.currentState!.validate() == true) {
      try {
        final token = UserSession.token;
        if (token == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("No token found. Please login again."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
        if (oldPass == newPass) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("New password cannot be the same as old password"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
        final message = await AuthApiManager.resetPassword(
          oldPassword: oldPass,
          newPassword: newPass,
          token: token,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.green),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutesApp.loginRouteName,
              (route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    checkPassController.dispose();
    super.dispose();
  }
}
