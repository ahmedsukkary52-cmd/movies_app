import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
class CategoryScreenShots extends StatelessWidget {
  final String screenShotImage ;
  const CategoryScreenShots({super.key,required this.screenShotImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.2,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Image.asset(screenShotImage,fit: BoxFit.cover,),
    );
  }
}
