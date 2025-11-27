import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/ui/explore_screen/explore_screen.dart';
import 'package:team_flutter_6_movie_app/ui/home/home_screen.dart';
import 'package:team_flutter_6_movie_app/ui/profile/profile_screen.dart';
import 'package:team_flutter_6_movie_app/ui/search/search_screen.dart';

import '../../cubits/bottomNavBarCubit/bottom_nav_cubit.dart';
import 'bottom_nav_bar.dart';

class MainScreenBottomNav extends StatelessWidget {
  MainScreenBottomNav({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: IndexedStack(
                  index: state.currentIndex,
                  children: screens,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 12,
                child: CustomBottomNavBar(
                  currentIndex: state.currentIndex,
                  onTap: (index) {
                    context.read<NavigationCubit>().changeTab(index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
