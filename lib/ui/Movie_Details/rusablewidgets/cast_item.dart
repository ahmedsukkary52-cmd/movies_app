import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

import '../../../Utils/text_app.dart';
class CastItem extends StatelessWidget {
  final String castImage ;
  final String castName ;
  final String castCharacter ;
  const CastItem({super.key,required this.castImage,required this.castCharacter,required this.castName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorApp.grayColor
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child:Container(
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset(castImage,fit: BoxFit.cover,),
              )
          ),
          Expanded(
            flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name : $castName',style: TextApp.regular20White,),
                  Text('Character : $castCharacter',style: TextApp.regular20White,),
                ],
              ))
        ],
      ),
    );
  }
}
