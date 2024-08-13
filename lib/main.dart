import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:html_front/pages/login_page.dart';
import 'package:html_front/pages/splash_page.dart';
import 'package:html_front/tabs/tabs.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xD2B48C),
                brightness: Brightness.light)), //다크/라이트 모드 선택),
        initialRoute: "/splash",
        routes: {
          "/login": (context) => LoginPage(),
          "/home": (context) => Tabs(selectedIndex: 0),
          "/splash": (context) => SplashPage()
        });
  }
}
