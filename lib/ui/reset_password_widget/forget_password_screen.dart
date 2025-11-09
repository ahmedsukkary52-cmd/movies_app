import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/widget/custom_elevated_button.dart';
import 'package:team_flutter_6_movie_app/widget/custom_text_form_field.dart';

import '../../Utils/color_App.dart';


class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 ClipRRect(
                   child: Image(image: AssetImage(
                     PathImage.forgetPassword
                   )),
                 ),
                 SizedBox(
                   height: context.height*0.02,
                 ),
               CustomTextFormField(
                 prefixIcon: Icon(
                 Icons.email_rounded,color: ColorApp.whiteColor,
                 ),
                hintText: AppLocalizations.of(context)!.email,
                 validator: (text) {
                   if(text == null||text.trim().isEmpty){
                     return AppLocalizations.of(context)!.please_enter_email;
                   }
                   final bool emailValid =
                   RegExp(
                       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                       .hasMatch(text);
                   if (!emailValid) {
                     return AppLocalizations.of(context)!
                         .please_enter_valid_email;
                   }
                   return null;
                 },
               ),
                 SizedBox(
                   height: context.height*0.03,
                 ),
                 CustomElevatedButton(onPressed: () {
                   checkEmail(context);
                 },
                 text: AppLocalizations.of(context)!.verify_email,

                 )
               ],
            ),
          ),
        ),
      ),
    );
  }
  void checkEmail(BuildContext context) {
      if(formKey.currentState!.validate()==true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.verify_email),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pushNamed(RoutesApp.resetPasswordScreen);
      } else {
        return;
      }
  }
}
