import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';
import 'package:team_flutter_6_movie_app/cubit/select_index_avatars_cubit.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/model/avatars_model.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_text_field.dart';
import 'package:team_flutter_6_movie_app/ui/update_Profile/showBottomSheet.dart';

import '../../Utils/text_app.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController name = TextEditingController(text: "John Safwat");
  TextEditingController phone = TextEditingController(text: "01200000000");
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return BlocBuilder<SelectIndexAvatarsCubit, SelectIndexAvatarsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              local!.update_profile_pick_avatar,
              style: TextApp.regular16Wallow,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      bottomSheet(context);
                    },
                    child: Image.asset(
                      AvatarsModel.avatars[state.selectIndexAvatars],
                      width: context.width * 0.3,
                      height: context.height * 0.16,
                    ),
                  ),
                  SizedBox(height: context.height * 0.03),
                  CustomTextField(
                    prefixIconName: Icon(
                      Icons.person,
                      color: ColorApp.whiteColor,
                    ),
                    hintText: local.name,
                    controller: name,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      if (text.trim().length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.height * 0.02),
                  CustomTextField(
                    prefixIconName: Icon(
                      Icons.call,
                      color: ColorApp.whiteColor,
                    ),
                    hintText: local.phone_number,
                    controller: phone,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^[0-9]{10,11}$').hasMatch(text.trim())) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesApp.resetPasswordScreen,
                        );
                      },
                      child: Text(
                        local.update_profile_reset_password,
                        style: TextApp.regular20White,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    background: ColorApp.redColor,
                    textStyle: TextApp.regular20White,
                    text: local.update_profile_delete_account,
                    onPressed: () {
                      //todo delete account
                    },
                  ),
                  SizedBox(height: context.height * .02),
                  CustomElevatedButton(
                    text: local.update_profile_update_data,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String name2 = name.text.trim();
                        String phone2 = phone.text.trim();
                        print("Name: $name2");
                        print("Phone: $phone2");
                      } else {
                        print("Validation failed");
                        //todo update data
                      }
                    },
                  ),
                  SizedBox(height: context.height * .03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
