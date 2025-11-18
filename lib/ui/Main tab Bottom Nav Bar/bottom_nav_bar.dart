import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width*.04 ,vertical: context.height*.02),
      padding: EdgeInsets.symmetric(horizontal: context.width*.05, vertical: context.height*.014),
      decoration: BoxDecoration(
        color: ColorApp.grayColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem(icon: PathImage.homeSelected, index: 0, context: context),
          navItem(icon: PathImage.searchSelected, index: 1, context: context),
          navItem(icon: PathImage.exploreSelected, index: 2, context: context),
          navItem(icon: PathImage.profileSelected, index: 3, context: context),
        ],
      ),
    );
  }

  Widget navItem({required String icon, required int index , required BuildContext context}) {
    final isSelected = index == currentIndex;

    return IconButton(
      onPressed: () => onTap(index),
      icon: Image.asset(icon,
        height: context.height*.028,
        color: isSelected ?  ColorApp.primaryWallow : ColorApp.whiteColor,),);
  }
}
