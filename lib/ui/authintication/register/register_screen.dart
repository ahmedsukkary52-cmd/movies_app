
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/model/avatars_model.dart';

import '../../../Api/api_manager.dart';
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
                      //todo: name
                      prefixIconName: Image.asset(PathImage.name),
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
                      //todo: email
                      prefixIconName: Image.asset(PathImage.email),
                      hintText: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.please_enter_email;
                        }
                        final bool emailValid = RegExp(
                          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
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
                      //todo: password
                      hasSuffix: true,
                      obsecureText: true,
                      prefixIconName: Image.asset(PathImage.password),
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
                      //todo: confirmPassword
                      hasSuffix: true,
                      obsecureText: true,
                      prefixIconName: Image.asset(PathImage.password),
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      controller: confirmPasswardController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.password_not_match;
                        }
                        if (text.length < 6) {
                          return AppLocalizations.of(context)!.password_too_short;
                        }
                        if (text != passwardController.text) {
                          return AppLocalizations.of(context)!.password_not_match;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      //todo: phone
                      isNumber: true,
                      prefixTxt: '+201',
                      prefixIconName: Image.asset(PathImage.call),
                      hintText: AppLocalizations.of(context)!.phone_number,
                      controller: phoneNumberController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.enter_phone_number;
                          }
                          if (!RegExp(r'^[0-9]{9}$').hasMatch(text)) {
                            return 'Enter valid phone number after +20';
                          }
                          return null;
                        }

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
                                builder: (context) => LoginScreen(),
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

  void createAccount() async{
    if (formKey.currentState!.validate()) {
      showToast('Loading .....', bgColor: ColorApp.primaryWallow);
      String fullPhone = '+201${phoneNumberController.text}';
      var response = await ApiManager.register(
          email: emailController.text,
          password: passwardController.text,
          confirmPassword: confirmPasswardController.text,
          name: nameController.text,
          phone: fullPhone,
          avaterId: context.read<SelectIndexAvatarsState>().selectIndexAvatars
      );
      if (response.statusCode != 400) {
        showToast(response.message ?? "Success",
            bgColor: ColorApp.primaryWallow);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
        return;
      }
      if (response.message != null &&
          response.message!.isNotEmpty) {
        showToast(response.message!,
            bgColor: ColorApp.redColor);
        return;
      }
      if (response.messageList != null &&
          response.messageList!.isNotEmpty) {

        String errors = response.messageList!.join("\n");

        showToast(errors, bgColor: ColorApp.redColor);
        return;
      }
    }

  }
  void showToast(String message, {Color bgColor = ColorApp.primaryWallow}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor,
      textColor: ColorApp.primaryBlack,
      fontSize: 16.0,
    );
  }

}
/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/model/avatars_model.dart';
import '../../../Api/api_manager.dart';
import '../../../Utils/color_App.dart';
import '../../../Utils/text_app.dart';
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
  int selectedAvaterId = 1 ;
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
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                animateToClosest: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.45,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedAvaterId = index + 1 ;
                  });
                },
              ),
              items: AvatarsModel.avatars.map((imagePath) {
                int index = AvatarsModel.avatars.indexOf(imagePath);
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedAvaterId = index + 1;
                        });
                      },
                      child: Container(
                        width: context.width * 0.4,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: selectedAvaterId == index + 1 ? ColorApp.primaryWallow : ColorApp.transparent,),
                        child: Image.asset(imagePath, fit: BoxFit.contain),
                      ),
                    );
                  },
                );
              }).toList(),
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
                      prefixIconName: PathImage.name,
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
                      prefixIconName: PathImage.email,
                      hintText: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_email;
                        }
                        final bool emailValid = RegExp(
                          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
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
                      prefixIconName: PathImage.password,
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      controller: confirmPasswardController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.password_not_match;
                        }
                        if (text.length < 6) {
                          return AppLocalizations.of(context)!.password_too_short;
                        }
                        if (text != passwardController.text) {
                          return AppLocalizations.of(context)!.password_not_match;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomTextField(
                      isNumber: true,
                      prefixIconName: PathImage.call,
                        prefixTxt: '+201*****',
                      hintText: AppLocalizations.of(context)!.phone_number,
                      controller: phoneNumberController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.enter_phone_number;
                        }
                        if (!RegExp(r'^[0-9]{9}$').hasMatch(text)) {
                          return 'Enter valid phone number after +20';
                        }
                        return null;
                      }
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
                                builder: (context) => LoginScreen(),
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
  void createAccount() async {
    if (formKey.currentState!.validate()) {
      showToast('Loading .....', bgColor: ColorApp.primaryWallow);
      String fullPhone = '+201${phoneNumberController.text}';
      var response = await ApiManager.register(
        email: emailController.text,
        password: passwardController.text,
        confirmPassword: confirmPasswardController.text,
        name: nameController.text,
        phone: fullPhone,
        avaterId: selectedAvaterId
      );
      if (response.statusCode != 400) {
        showToast(response.message ?? "Success",
            bgColor: ColorApp.primaryWallow);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
        return;
      }
      if (response.message != null &&
          response.message!.isNotEmpty) {
        showToast(response.message!,
            bgColor: ColorApp.redColor);
        return;
      }
      if (response.messageList != null &&
          response.messageList!.isNotEmpty) {

        String errors = response.messageList!.join("\n");

        showToast(errors, bgColor: ColorApp.redColor);
        return;
      }
    }
  }
  void showToast(String message, {Color bgColor = ColorApp.primaryWallow}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor,
      textColor: ColorApp.primaryBlack,
      fontSize: 16.0,
    );
  }
}
 */
