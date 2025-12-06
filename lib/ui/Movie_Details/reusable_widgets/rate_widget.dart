import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

import '../../../Utils/color_App.dart';
class RateWidget extends StatelessWidget {
  final String imageName ;
  final num rateNumber ;
  const RateWidget({super.key,required this.imageName,required this.rateNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.05,
      width: context.width*0.29,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorApp.grayColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageName,fit: BoxFit.cover ,width: context.width*0.07,),
          Text('$rateNumber',style: TextApp.bold24White,)
        ],
      ),
    );
  }
}