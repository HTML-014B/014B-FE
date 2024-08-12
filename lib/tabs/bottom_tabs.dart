import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/screens/detail_screen.dart';
import 'package:html_front/screens/home_screen.dart';
import 'package:html_front/screens/managePlants_screen.dart';
import 'package:html_front/screens/myPage_screen.dart';
import 'package:html_front/screens/store_screen.dart';
import 'package:html_front/screens/test_screen.dart';

// bottom tabs 정리한 클래스
class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(Icons.home),
          title: Text("홈"),
        ),
        TabNavigationItem(
          page: StoreScreen(),
          icon: Icon(Icons.headphones_rounded),
          title: Text("상점"),
        ),
        TabNavigationItem(
          page: ManagePlantsScreen(),
          icon: Icon(Icons.location_city),
          title: Text("텃밭관리"),
        ),
        TabNavigationItem(
          page: MyPageScreen(),
          icon: Icon(Icons.headphones_rounded),
          title: Text("마이페이지"),
        )
      ];
}
