import 'package:flutter/material.dart';
import 'package:instagramui/main.dart';
import 'package:instagramui/view/homescreen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.network(
                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fuxwing.com%2Finstagram-text-icon%2F&psig=AOvVaw2sqf-jhPZY3pr56XRpKWmn&ust=1700888899651000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLDvuYTv24IDFQAAAAAdAAAAABAE'),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'phonenumber or email '),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'password '),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  checkLogin(context);
                },
                child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                    ),
                    child: Center(
                        child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    if (namecontroller.text == passcontroller.text) {
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(savekey, true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
