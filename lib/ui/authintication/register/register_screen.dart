import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/model/avatars_model.dart';

import '../../../Utils/color_App.dart';
import '../../../Utils/text_app.dart';
import '../../../cubits/cubit/select_index_avatars_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../home/home_screen.dart';
import '../login/login_screen.dart';
import '../rusable_widget/custom_elevated_button.dart';
import '../rusable_widget/custom_text_field.dart';
import '../rusable_widget/toggle_switchs.dart';

var formKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswardController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: ColorApp.primaryWallow,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: TextApp.regular16Wallow,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SelectIndexAvatarsCubit, SelectIndexAvatarsState>(
              builder: (context, state) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: context.height * .16,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: .36,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeFactor: 0.55,
                    initialPage: state.selectIndexAvatars,
                    onPageChanged: (index, reason) {
                      context
                          .read<SelectIndexAvatarsCubit>()
                          .updateSelectIndexAvatars(index);
                    },
                  ),
                  itemCount: AvatarsModel.avatars.length,
                  itemBuilder: (context, index, realIndex) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        AvatarsModel.avatars[index],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              AppLocalizations.of(context)!.avatar,
              style: TextApp.regular16White,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      prefixIconName: Icon(
                        Icons.person,
                        color: ColorApp.whiteColor,
                      ),
                      hintText: AppLocalizations.of(context)!.name,
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.enter_name;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      prefixIconName: Icon(
                        Icons.email_rounded,
                        color: ColorApp.whiteColor,
                      ),
                      hintText: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.please_enter_email;
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
                      prefixIconName: Icon(
                        Icons.lock,
                        color: ColorApp.whiteColor,
                      ),
                      hintText: AppLocalizations.of(context)!.password,
                      controller: passwardController,
                      validator: (text) {
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
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      hasSuffix: true,
                      obsecureText: true,
                      prefixIconName: Icon(
                        Icons.lock,
                        color: ColorApp.whiteColor,
                      ),
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      controller: confirmPasswardController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.password_not_match;
                        }
                        if (text.length < 6) {
                          return AppLocalizations.of(
                            context,
                          )!.password_too_short;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      isNumber: true,
                      prefixIconName: Icon(
                        Icons.call,
                        color: ColorApp.whiteColor,
                      ),
                      hintText: AppLocalizations.of(context)!.phone_number,
                      controller: phoneNumberController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.enter_phone_number;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomElevatedButton(
                      text: AppLocalizations.of(context)!.create_account,
                      onPressed: createAccount,
                    ),
                    SizedBox(height: context.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already_have_account,
                          style: TextApp.regular16White,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: TextApp.regular14Wallow,
                          ),
                        ),
                      ],
                    ),
                    ToggleSwitch(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    }
  }
}
