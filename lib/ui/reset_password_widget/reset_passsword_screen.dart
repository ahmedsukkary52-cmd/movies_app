import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

import '../../Utils/assets_app.dart';
import '../../Utils/color_App.dart';
import '../../Utils/text_app.dart';
import '../../l10n/app_localizations.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';

class ResetPassswordScreen extends StatelessWidget {
   ResetPassswordScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsetsGeometry.symmetric(
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
                CustomTextFormField(/// todo: old pass
                  prefixIcon: Icon(
                    Icons.lock,color: ColorApp.whiteColor,
                  ),
                  hintText: AppLocalizations.of(context)!.old_pass,
                  validator:(text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_password;
                    }
                    return null;
                  },
                ),
                SizedBox(
                 height: context.height*0.02,
                 ),
                CustomTextFormField(    /// todo: new pass
                  prefixIcon: Icon(
                    Icons.lock,color: ColorApp.whiteColor,
                  ),
                  hintText: AppLocalizations.of(context)!.new_pass,
                  controller: newPassController,
                  validator:(text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_password;
                    }
                    if (text.length < 6) {
                      return AppLocalizations.of(
                        context,
                      )!.password_too_short;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: context.height*0.02,
                ),
                CustomTextFormField(   /// todo: check new pass
                  prefixIcon: Icon(
                    Icons.password,color: ColorApp.whiteColor,
                  ),
                  hintText: AppLocalizations.of(context)!.new_pass,
                  controller: checkPassController,
                  validator: (text) {
                    if(text== null || text.trim().isEmpty){
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_password;
                    }
                    if(text != newPassController.text){
                     return AppLocalizations.of(context)!.password_not_match;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: context.height*0.02,
                ),
                CustomElevatedButton(onPressed: () {
                /// reset pass
                  checkPass(context);
                },
                text: AppLocalizations.of(context)!.reset_password,
                )
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
