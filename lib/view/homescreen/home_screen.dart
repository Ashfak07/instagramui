import 'package:flutter/material.dart';
import 'package:instagramui/main.dart';
import 'package:instagramui/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.tv_outlined),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                logout(context);
              },
              child: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 59, 44, 83),
                                        const Color.fromARGB(255, 244, 54, 127)
                                      ])),
                              child: CircleAvatar(
                                radius: 40,
                              ),
                            ),
                          )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    Text('username'),
                    SizedBox(
                      width: 190,
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.comment),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.share)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 180,
          )
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setBool(savekey, false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
