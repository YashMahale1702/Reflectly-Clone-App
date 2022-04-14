import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/main_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Afternoon,',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontSize: 28.0,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(.6),
                              blurRadius: 1,
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Yash',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6),
                          fontSize: 28.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'Reflectly_face',
                    child: AvatarGlow(
                      endRadius: 70.0,
                      glowColor: Colors.grey,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 4000),
                      repeatPauseDuration: const Duration(milliseconds: 300),
                      child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          child:
                              Image.asset('assets/images/reflectly_face.gif'),
                          radius: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 80,
                // ),
                Column(
                  children: [
                    MainTile(
                      title: 'Daily Reflection',
                      subTitle: 'Memories, Self-Love',
                      color1: Color(0xff3f9cad),
                      color2: Color(0xff7599f5),
                      icon: MaterialCommunityIcons.meteor,
                    ),
                    MainTile(
                      title: 'Morning Motivation',
                      subTitle: 'Start Today',
                      color1: Color(0xfffc4a1a),
                      color2: Color(0xfff7b733),
                      icon: MaterialCommunityIcons.meteor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  child: Text(
                    'Next Page',
                    style: TextStyle(),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(NextScreen.routeName);
                  },
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(40.0),
                  pressedOpacity: .8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
