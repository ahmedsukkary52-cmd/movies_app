import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_elevated_button.dart';
import 'package:team_flutter_6_movie_app/ui/profile/widget/watch_list_item.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final List watchList =[PathImage.onboarding3,PathImage.onboarding4,PathImage.onboarding5,PathImage.onboarding6];
   final List historyList =[];
   @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(toolbarHeight: context.height*0.2,
        backgroundColor: ColorApp.grayColor,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // SizedBox(width: context.width *0.02,),
              Column(
                children: [
                  CircleAvatar(radius: 52,
                    child: Image(image: AssetImage(PathImage.avatar1)),
                  ),
                  SizedBox(height: context.height *0.01,),

                  Text('user Name',style: TextApp.bold20White,)
                ],
              ),
              SizedBox(width: context.width *0.035,),
              Column(
                children: [
                  Text('12',style: TextApp.bold36White,),
                  SizedBox(height: context.height *0.015,),
                  Text('Watch List',style: TextApp.bold24White,),
                ],
              ),
              SizedBox(width: context.width *0.055,),
              Column(
                children: [
                  Text('10',style: TextApp.bold36White,),
                  SizedBox(height: context.height *0.015,),
                  Text('History',style: TextApp.bold24White,),
                ],
              )
            ],
          ),
        ),
      ),
      body:
      Column(
        children: [
          Container(
            color: ColorApp.grayColor,
            padding: EdgeInsetsGeometry.symmetric(horizontal: context.width*0.03
            ,vertical: context.height*0.02),
            child: Row(children: [
              Expanded(
                flex: 4,
                child: CustomElevatedButton(text: 'Edit Profile', onPressed: () {
                },
                height: context.height*0.075,
                ),
              ),
              SizedBox(width: context.width*0.02,),
              Expanded(
                flex: 2,
                child: CustomElevatedButton(text: 'Exit', onPressed: () {
                },
                  height: context.height*0.075,
                  textStyle: TextApp.regular20White,
                background: ColorApp.redColor,
                  hasIcon: true,
                  // iconColor: ColorApp.whiteColor,
                  // iconImage: PathImage.exit,
                  customWidgetWithIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Exit', style: TextApp.regular20White),
                      SizedBox(width: context.width* .02),
                      ImageIcon(
                        AssetImage( PathImage.exit ),
                        color: ColorApp.whiteColor,
                        size: 22,
                      ),
                    ],),
                ),
              ),
            ],),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: ColorApp.grayColor,
                    child: TabBar(
                      indicatorColor: ColorApp.primaryWallow,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: ColorApp.whiteColor,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextApp.regular20White,
                      tabs: const [
                        Tab(icon: Icon(Icons.list,color: ColorApp.primaryWallow,size: 38,), text: "Watch List",),
                        Tab(icon: Icon(Icons.folder,color: ColorApp.primaryWallow,size: 38,), text: "History"),
                      ],
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        watchList.isEmpty   /// todo : watch list
                            ? Center(
                          child: Image.asset(PathImage.emptyImage, width: 120),
                        )
                            : GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: context.height * 0.025,
                          ),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: context.width * 0.02,
                            mainAxisSpacing: context.height * 0.02,
                          ),
                          itemCount: watchList.length,
                          itemBuilder: (context, index) {
                            return WatchListItem(
                              watchListMovieImage: watchList[index], /// todo: import api movie image
                              imdbRate: '7.7',  /// todo: import imdb movie rate
                            );
                          },
                        ),
                        // HISTORY CONTENT
                        historyList.isEmpty        /// todo : history
                            ? Center(
                          child: Image.asset(
                            PathImage.emptyImage,
                            width: 120,
                          ),
                        )
                            : GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: context.height * 0.025,
                          ),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: context.width * 0.02,
                            mainAxisSpacing: context.height * 0.02,
                          ),
                          itemCount: historyList.length,
                          itemBuilder: (context, index) {
                            return WatchListItem(
                              watchListMovieImage: historyList[index],  /// todo: import api movie image
                              imdbRate: '7.7', /// todo: import imdb movie rate
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
