import 'package:flutter/material.dart';
import 'package:instagramui/view/homescreen/home_screen.dart';
import 'package:instagramui/view/login/login.dart';
import 'package:instagramui/view/splashscreen/splash.dart';

const savekey = 'userloged';
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
      home: Splash(),
    );
  }
}
