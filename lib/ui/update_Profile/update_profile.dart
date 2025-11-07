import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/ui/update_Profile/update_name_phone.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController name = TextEditingController(text: "John Safwat");

  TextEditingController phone = TextEditingController(text: "01200000000");

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          local!.update_profile_pick_avatar,
          style: TextApp.regular16primaryWallow,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
        child: Column(
          children: [
            UpdateNamePhone(
              controller: name,
              prefixIcon: Icon(Icons.person, color: ColorApp.whiteColor),
            ),
            SizedBox(height: context.height * 0.02),
            UpdateNamePhone(
              controller: phone,
              prefixIcon: Icon(Icons.call, color: ColorApp.whiteColor),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  //todo push Screen Reset Password
                },
                child: Text(
                  local.update_profile_reset_password,
                  style: TextApp.regular20White,
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.01,
                horizontal: context.width * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorApp.redColor,
              ),
              child: Text(
                local.update_profile_delete_account,
                style: TextApp.regular20White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
