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

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final mainTileData = Provider.of<MainTileData>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.7),
      body: Container(
        height: device.height,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
          gradient: LinearGradient(
            colors: [
              // theme.primaryColor,
              theme.accentColor,
              Color(0xff84fab0),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Ionicons.ios_calendar,
                        color: Colors.white.withOpacity(.8),
                        size: 30,
                      ),
                    ),
                    ZoomIn(
                      animate: true,
                      from: 1,
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 200),
                      child: AvatarGlow(
                        endRadius: 70.0,
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
                            radius: 38,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Entypo.cross,
                          color: Colors.white.withOpacity(.8),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 900),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hey, Yash. How are you this ${mainTileData.greet()}?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
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
                Icon(
                  Entypo.emoji_sad,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Really Terrible'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Slider(
                  min: 0,
                  max: 5,
                  divisions: 5,
                  label: '$moodRating',
                  activeColor: Colors.white,
                  inactiveColor: theme.primaryColor,
                  value: moodRating,
                  onChanged: (value) {
                    setState(
                      () {
                        moodRating = value;
                      },
                    );
                  },
                ),
              ],
            ),
            ZoomIn(
              delay: Duration(milliseconds: 1500),
              duration: Duration(milliseconds: 500),
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
