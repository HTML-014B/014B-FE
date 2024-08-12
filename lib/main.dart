import 'package:flutter/material.dart';
import 'package:html_front/tabs/tabs.dart';


void main() {
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
        initialRoute: "/home",
        routes: {"/home": (context) => Tabs(selectedIndex: 0)});
  }
}
