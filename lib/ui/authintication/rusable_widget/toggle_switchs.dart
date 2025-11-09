import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/reusable_code/toggle_local.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
    current: value,
      values: [0, 1],
      onChanged: (index) => setState(() {
        value = index;
        if (value == 0) {
          toggleLocale(context);
        } else {
          toggleLocale(context);
        }
      }),
      iconBuilder: (value, foreground) {
        return Center(
          child: ClipOval(
            child: value == 0
                ? Image.asset(PathImage.english, fit: BoxFit.cover)
                : Image.asset(PathImage.arabic, fit: BoxFit.cover),
          ),
        );
      },
      style: ToggleStyle(
        backgroundColor: ColorApp.transparent,
        borderColor: ColorApp.primaryWallow,
        borderRadius: BorderRadius.circular(80),
        indicatorBorder: Border.all(color: ColorApp.primaryWallow, width: 4),
        indicatorColor: ColorApp.transparent,
      ), // optional style settings
    );
  }
}
