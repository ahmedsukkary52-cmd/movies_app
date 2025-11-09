import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

class AvatarsImage extends StatelessWidget {
  String image;
  bool isSelect;

  AvatarsImage({super.key, required this.image, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorApp.primaryWallow),
        color: isSelect ? ColorApp.primaryWallow : ColorApp.transparent,
      ),
      child: Image.asset(
        image,
        width: context.width * 0.2,
        height: context.height * 0.11,
      ),
    );
  }
}
