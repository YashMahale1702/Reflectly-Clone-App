import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../providers/mainTile_data.dart';

class MoodsScreen extends StatefulWidget {
  static const routeName = '/moods-screen';

  @override
  _MoodsScreenState createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  double moodRating = 0;
  IconData moodIcon = Entypo.emoji_sad;
  String moodText = 'Really Terrible';

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    // final theme = Theme.of(context);
    final mainTileData = Provider.of<MainTileData>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.7),
      body: Container(
        height: device.height,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
          gradient: LinearGradient(
            colors: [
              // theme.primaryColor,
              Color(0xff779af6),
              Color(0xff3c9caa),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeIn(
                      delay: const Duration(milliseconds: 2000),
                      duration: const Duration(milliseconds: 200),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          AntDesign.calendar,
                          color: Colors.white.withOpacity(.8),
                          size: 25,
                        ),
                      ),
                    ),
                    ZoomIn(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 200),
                      child: AvatarGlow(
                        endRadius: 50.0,
                        glowColor: Colors.white,
                        curve: Curves.linear,
                        duration: Duration(milliseconds: 3000),
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: Material(
                          elevation: 20.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            child:
                                Image.asset('assets/images/reflectly_face.gif'),
                            radius: 35,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: FadeIn(
                        delay: const Duration(milliseconds: 2000),
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Feather.x,
                            color: Colors.white.withOpacity(.8),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hey, Yash. How are you this ${mainTileData.greet()}?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                moodChanger(moodIcon, moodText),
                SizedBox(
                  height: 10,
                ),
                FadeInUp(
                  delay: Duration(milliseconds: 1400),
                  duration: Duration(milliseconds: 300),
                  child: Slider(
                    min: 0,
                    max: 3,
                    divisions: 3,
                    label: '${(moodRating + 1).toStringAsFixed(0)}',
                    activeColor: Colors.white,
                    inactiveColor: Colors.white.withOpacity(.3),
                    value: moodRating,
                    onChanged: (value) {
                      setState(
                        () {
                          moodRating = value;
                          List data = mainTileData.moodChange(value);
                          moodIcon = data[0];
                          moodText = data[1];
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            ZoomIn(
              animate: true,
              controller: (animationController) {},
              delay: Duration(milliseconds: 1600),
              duration: Duration(milliseconds: 600),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor,
                      ],
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget moodChanger(icon, text) {
  return Column(
    children: [
      FadeInUp(
        delay: Duration(milliseconds: 800),
        duration: Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: Colors.white,
          size: 100,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      FadeInUp(
        delay: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 300),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
