import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/ui/explore/explore_screen.dart';
import 'package:team_flutter_6_movie_app/ui/home/home_screen.dart';
import 'package:team_flutter_6_movie_app/ui/profile/profile_screen.dart';
import 'package:team_flutter_6_movie_app/ui/search/search_screen.dart';

import 'bottom_nav_bar.dart';

class MainScreenBottomNav extends StatefulWidget {
   MainScreenBottomNav({super.key});

  @override
  State<MainScreenBottomNav> createState() => _MainScreenBottomNavState();
}

class _MainScreenBottomNavState extends State<MainScreenBottomNav> {
   final List<Widget> screens = [HomeScreen() , SearchScreen(), ExploreScreen() , ProfileScreen()];
   int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: screens[currentIndex]),
          Positioned(
            left: 0,
            right: 0,
            bottom: context.height* .008,
            child: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
