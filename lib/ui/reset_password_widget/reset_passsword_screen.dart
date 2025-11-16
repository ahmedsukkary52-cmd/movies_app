import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';

import '../../Utils/assets_app.dart';
import '../../Utils/color_App.dart';
import '../../Utils/text_app.dart';
import '../../l10n/app_localizations.dart';
import '../authintication/rusable_widget/custom_text_field.dart';

class ResetPassswordScreen extends StatelessWidget {
   ResetPassswordScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPassController = TextEditingController();
    final TextEditingController newPassController= TextEditingController();
    final TextEditingController checkPassController= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, /// back button
        iconTheme: const IconThemeData(
          color: ColorApp.primaryWallow,
        ),
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
            horizontal: context.width*0.04
            ,vertical: context.height*0.02
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  child: Image(image: AssetImage(
                      PathImage.forgetPassword
                  )),
                ),
                SizedBox(
                  height: context.height*0.02,
                ),
                CustomTextField(
                  prefixIconName: Icon(
                    Icons.lock,
                    color: ColorApp.whiteColor,
                  ),
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
                SizedBox(
                 height: context.height*0.02,
                 ),
                CustomTextField(
                  prefixIconName: Icon(
                    Icons.lock,
                    color: ColorApp.whiteColor,
                  ),
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
                  hasSuffix: true,      // عشان تظهر أيقونة show/hide
                  obsecureText: true,   // عشان يبدأ مخفي
                ),
                SizedBox(
                  height: context.height*0.02,
                ),
                CustomTextField(
                  prefixIconName: Icon(
                    Icons.password,
                    color: ColorApp.whiteColor,
                  ),
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
                SizedBox(
                  height: context.height*0.02,
                ),
                CustomElevatedButton(text: AppLocalizations.of(context)!.reset_password, onPressed: (){
                  checkPass(context);
                  // todo: reset Password
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
  void checkPass(BuildContext context) {
    if(formKey.currentState!.validate()==true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.reset_password),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      return;
    }
  }
}
