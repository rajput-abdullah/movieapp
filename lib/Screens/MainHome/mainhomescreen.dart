

import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Dashboard/dashboard.dart';
import 'package:movieapp/Screens/MediaLibrary/medialibraryscreen.dart';
import 'package:movieapp/Screens/More/morescreen.dart';
import 'package:movieapp/Screens/MovieWatchList/moviewatchlaterscreen.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  late List<Widget> _screens;
  int _activeIndex = 0;

  @override
  void initState() {

    _screens = [
      const Dashboard(),
      MovieWatchLaterScreen(),
      const MediaLibraryScreen(),
      const MoreScreen(),
    ];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: _screens[_activeIndex],
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  Widget _bottomBar() => Container(
    decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            14.0,
          ),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.bottomBarShadow,
        //     blurRadius: 18.0,
        //   )
        // ]
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: BottomNavigationBar(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,

      currentIndex: _activeIndex,
      onTap: (int currentIndex) {
        setState(() {
          _activeIndex = currentIndex;
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.darkBlue,

          icon: Image.asset(
            Assets.dashboard ,
            color:  AppColors.whiteColor,

          ),
          label: "Dashboard"// title: const EmptyText(),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.play,

          ),

            label: "Watch"// title: const EmptyText(),

          // title: const EmptyText(),
          // selectedColor: AppColors.foodTypeButtonColor,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.library,
            // color: AppColors.whiteColor,

          ),
            label: "Media Library"// title: const EmptyText(),

          // title: const EmptyText(),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
           Assets.more,
            color: AppColors.whiteColor,
          ),
            label: "More"// title: const EmptyText(),

          // title: const EmptyText(),
        ),
      ],
    ),
  );
}
