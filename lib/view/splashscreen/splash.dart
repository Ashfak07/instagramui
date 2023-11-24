import 'package:flutter/material.dart';
import 'package:instagramui/main.dart';
import 'package:instagramui/view/homescreen/home_screen.dart';
import 'package:instagramui/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkUserLoged();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('INSTAGRAM'),
      ),
    );
  }

  Future<void> checkUserLoged() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userloged = await sharedpref.get(savekey);
    if (userloged == null || userloged == false) {
      gotologin();
    } else {
      splashwait();
    }
  }

  gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  splashwait() async {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }
  // Future<void> checkUserLogin(BuildContext context) async {
  //   final sharepref = await SharedPreferences.getInstance();
  //   final userloged = sharepref.get(savekey);
  //   if (userloged == null || userloged == false) {
  //     gotoLogin(context);
  //   } else {
  //     Splashwait(context);
  //   }
  // }

  // gotoLogin(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => LoginPage()));
  // }

  // Splashwait(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 3)).then((value) =>
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomeScreen())));
  // }
}
