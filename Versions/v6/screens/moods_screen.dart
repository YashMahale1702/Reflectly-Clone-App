import 'package:flutter/cupertino.dart';
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

class _MoodsScreenState extends State<MoodsScreen>
    with SingleTickerProviderStateMixin {
  double moodRating = 0;
  IconData moodIcon = Entypo.emoji_sad;
  String moodText = 'Really Terrible';
  bool isInitial = true;
  int pageValue = 0;

  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.easeOutBack,
        parent: _controller,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final mainTileData = Provider.of<MainTileData>(context, listen: false);

    return Container(
      height: device.height * .9,
      // margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
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
      child: PageView(
        onPageChanged: (value) {
          if (pageValue == 1) {}
        },
        children: [buildColumn1(context, mainTileData), buildColumn2()],
      ),
    );
  }

  Column buildColumn2() {
    return Column(
      children: [
        Center(
          child: Text('This is second page'),
        )
      ],
    );
  }

  Column buildColumn1(BuildContext context, MainTileData mainTileData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(.6),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 1600),
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
                ScaleTransition(
                  scale: _scaleAnimation,
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
                        child: Image.asset('assets/images/reflectly_face.gif'),
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
                    delay: const Duration(milliseconds: 1600),
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
              from: 50,
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
              from: 20,
              delay: Duration(milliseconds: 1200),
              duration: Duration(milliseconds: 200),
              child: Slider(
                min: 0,
                max: 4,
                divisions: 4,
                label: '${(moodRating + 1).toStringAsFixed(0)}',
                activeColor: Theme.of(context).accentColor,
                inactiveColor: Colors.white.withOpacity(.6),
                value: moodRating,
                onChanged: (value) {
                  setState(
                    () {
                      moodRating = value;
                      isInitial = false;
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
        ScaleTransition(
          scale: _scaleAnimation,
          child: InkWell(
            splashColor: Colors.white.withOpacity(.6),
            onTap: () {
              setState(() {
                pageValue = 1;
                print(pageValue);
              });
            },
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
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget moodChanger(icon, text) {
  return Column(
    children: [
      FadeInUp(
        from: 25,
        delay: Duration(milliseconds: 800),
        duration: Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: Colors.white.withOpacity(.9),
          size: 100,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      FadeInUp(
        from: 20,
        delay: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 200),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
