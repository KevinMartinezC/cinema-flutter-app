import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cinema_app/config/helpers/platform_helper.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: PlatformHelper.isIOS 
          ? CupertinoColors.systemBackground 
          : null,
      selectedItemColor: PlatformHelper.isIOS 
          ? CupertinoColors.activeBlue 
          : null,
      unselectedItemColor: PlatformHelper.isIOS 
          ? CupertinoColors.inactiveGray 
          : null,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            PlatformHelper.isIOS ? CupertinoIcons.house : Icons.home_max,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            PlatformHelper.isIOS ? CupertinoIcons.tag : Icons.label_outline,
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            PlatformHelper.isIOS ? CupertinoIcons.heart : Icons.favorite_outline,
          ),
          label: 'Favorite',
        ),
      ],
    );
  }
}
