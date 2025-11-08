import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/cubit/select_index_avatars_cubit.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/model/avatars_model.dart';
import 'package:team_flutter_6_movie_app/ui/update_Profile/avatars_image.dart';
import 'package:team_flutter_6_movie_app/ui/update_Profile/update_name_phone.dart';

import '../../Utils/text_app.dart';
import 'container_button.dart';

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
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: Image.asset(
                    AvatarsModel.avatars[state.selectIndexAvatars],
                    width: context.width * 0.3,
                    height: context.height * 0.16,
                  ),
                ),
                SizedBox(height: context.height * 0.03),
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
                ContainerButton(
                  onTap: () {
                    //todo delete account
                  },
                  text: local.update_profile_delete_account,
                  color: ColorApp.redColor,
                  textStyle: TextApp.regular20White,
                ),
                ContainerButton(
                  onTap: () {
                    //todo update data
                    String name2 = name.text;
                    String phone2 = phone.text;
                    print(name2);
                    print(phone2);
                  },
                  text: local.update_profile_update_data,
                  color: ColorApp.primaryWallow,
                  textStyle: TextApp.regular20black,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      backgroundColor: ColorApp.transparent,
      context: parentContext,
      builder: (context) {
        return BlocProvider.value(
          value: parentContext.read<SelectIndexAvatarsCubit>(),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: parentContext.width * 0.92,
                height: parentContext.height * 0.45,
                margin: EdgeInsets.only(
                  left: parentContext.width * 0.03,
                  right: parentContext.width * 0.03,
                  bottom: parentContext.height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ColorApp.grayColor,
                ),
                child:
                    BlocBuilder<
                      SelectIndexAvatarsCubit,
                      SelectIndexAvatarsState
                    >(
                      builder: (context, state) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          padding: EdgeInsets.symmetric(
                            vertical: parentContext.height * 0.03,
                            horizontal: parentContext.width * 0.03,
                          ),
                          itemCount: AvatarsModel.avatars.length,
                          itemBuilder: (context, index) {
                            final cubit = context
                                .read<SelectIndexAvatarsCubit>();
                            final state = cubit.state;

                            return InkWell(
                              onTap: () {
                                cubit.updateSelectIndexAvatars(index);
                                Navigator.pop(context);
                              },
                              child: AvatarsImage(
                                image: AvatarsModel.avatars[index],
                                isSelect: state.selectIndexAvatars == index,
                              ),
                            );
                          },
                        );
                      },
                    ),
              );
            },
          ),
        );
      },
    );
  }
}
