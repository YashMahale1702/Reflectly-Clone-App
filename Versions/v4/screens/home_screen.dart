import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../providers/variables.dart';
import '../providers/mainTile_data.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/main_tile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 700;
  String greetText = '';

  @override
  Widget build(BuildContext context) {
    final mainTileData = Provider.of<MainTileData>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: FadeInUpBig(
        child: Bottom(),
        delay: const Duration(milliseconds: 1400),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      from: 30,
                      child: Text(
                        'Good ${mainTileData.greet()},',
                        style: TextStyle(
                          color: Variables.subTitleColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Variables.subTitleColor,
                              blurRadius: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                      animate: true,
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 250),
                      from: 30,
                      child: Text(
                        'Yash',
                        style: TextStyle(
                          color: Variables.titleColor,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(8.0),
                child: ZoomIn(
                  animate: true,
                  delay: const Duration(milliseconds: 700),
                  duration: const Duration(milliseconds: 400),
                  child: Hero(
                    tag: 'Reflectly_face',
                    child: AvatarGlow(
                      endRadius: 70.0,
                      glowColor: Variables.primaryGreen,
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
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: mainTileData.items.map((cur) {
                  i = i + 350;
                  return FadeInRight(
                    duration: const Duration(milliseconds: 450),
                    delay: Duration(milliseconds: i + 200),
                    child: ZoomIn(
                      child: MainTile(
                        color1: cur.color1,
                        color2: cur.color2,
                        icon: cur.icon,
                        subTitle: cur.subTitle,
                        title: cur.title,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
