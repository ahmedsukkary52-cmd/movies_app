import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/cast_item.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/category_screen_shots.dart';
import 'package:team_flutter_6_movie_app/ui/Movie_Details/reusable_widgets/rate_widget.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';

import '../../../Utils/text_app.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                //height: context.height*0.9,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(PathImage.homeBg),fit: BoxFit.cover)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),iconSize: 30,color: ColorApp.whiteColor,),
                        InkWell(
                            onTap: () {},
                            child: Image.asset(PathImage.bookmark,width: context.width*0.06,height: context.height*0.06,)
                        )
                      ],
                    ),
                    SizedBox(height: 80),
                    Image.asset(PathImage.startMoveButton,fit: BoxFit.contain,height: context.height*0.15,width: context.width*0.2,),
                    SizedBox(height: 80),
                    Column(
                      children: [
                        Text('ajajajajaksksdlllfkflgkgkkgkgkgkggkbmbkmgkkmmgkvkvm',
                          style: TextApp.bold24White,
                        ),
                        SizedBox(height: context.height*0.02,),
                        Text('22',
                          style: TextApp.bold20Gray,
                        ),
                        SizedBox(height: context.height*0.02,),
                        CustomElevatedButton(
                            textStyle: TextApp.bold20White,
                            background: ColorApp.redColor,
                            text: AppLocalizations.of(context)!.watch,
                            onPressed: (){}),
                        SizedBox(height: context.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RateWidget(imageName: PathImage.favorite, rateNumber: 13),
                            RateWidget(imageName: PathImage.clock, rateNumber: 90),
                            RateWidget(imageName: PathImage.star, rateNumber: 7.8),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Screen Shots',style: TextApp.bold24White,),
                    SizedBox(height: context.height*0.02,),
                    SizedBox(
                      height: context.height * 0.25,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) => CategoryScreenShots(screenShotImage: PathImage.onboarding1),
                        separatorBuilder: (BuildContext context, int index) =>SizedBox(height: context.height*0.02,),
                        itemCount: 3,),
                    ),
                    SizedBox(height: context.height*0.02,),
                    Text('Similar',style: TextApp.bold24White,),
                    SizedBox(height: context.height*0.02,),
                    SizedBox(height: context.height*0.02,),
                    Text('Description',style: TextApp.bold24White,),
                    SizedBox(height: context.height*0.02,),
                    Text('bujjjjjjjjjjjjfxvfbbbbbbbbbbbb\ncdcdcdcdcdccdcd\ncdcdcdccdcd\n',style: TextApp.regular16White,),
                    SizedBox(height: context.height*0.02,),
                    Text('Cast',style: TextApp.bold24White,),
                    SizedBox(height: context.height*0.02,),
                    SizedBox(
                      height: context.height * 0.25,
                      child: ListView.separated(
                          itemBuilder: (context, index) => CastItem(castImage: PathImage.emptyImage, castCharacter: 'sddcscdc', castName: 'ahmed'),
                          separatorBuilder:(context, index) =>  SizedBox(height: context.height*0.02,),
                          itemCount: 4
                      ),
                    ),
                    SizedBox(height: context.height*0.02,),
                    Text('Genres',style: TextApp.bold24White,),
                    SizedBox(height: context.height*0.02,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
Text('Screen Shots',style: TextApp.bold24White,),
            SizedBox(height: context.height*0.02,),
            CategoryScreenShots(screenShotImage: PathImage.onboarding1),
            SizedBox(height: context.height*0.02,),
            CategoryScreenShots(screenShotImage: PathImage.onboarding1),
            SizedBox(height: context.height*0.02,),
            CategoryScreenShots(screenShotImage: PathImage.onboarding1),
            SizedBox(height: context.height*0.02,),
            Text('Similar',style: TextApp.bold24White,),
SizedBox(height: context.height*0.02,),
CategoryScreenShots(screenShotImage: PathImage.onboarding1),
Row(
              children: [
                MovieItem(movie: movie),
                SizedBox(width: context.width*.04,)
                MovieItem(movie: movie)
              ],
            )
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButton(
                          background: ColorApp.grayColor,
                          text: 'Action',
                          onPressed: (){}),
                      CustomElevatedButton(
                          background: ColorApp.grayColor,
                          text: 'Sci_Fi',
                          onPressed: (){}),
                      CustomElevatedButton(
                          background: ColorApp.grayColor,
                          text: 'Adventure',
                          onPressed: (){})
                    ],
                  ),
                  SizedBox(height: context.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButton(
                          background: ColorApp.grayColor,
                          text: 'Fantasy',
                          onPressed: (){}),
                      SizedBox(height: context.height*0.02,),
                      CustomElevatedButton(
                          background: ColorApp.grayColor,
                          text: 'Horor',
                          onPressed: (){}),
                    ],
                  )
 */