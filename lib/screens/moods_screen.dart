import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../providers/mainTile_data.dart';

class MoodsScreen extends StatefulWidget {
  static const routeName = '/moods-screen';
  final Color iconColor = Colors.white.withOpacity(.6);

  @override
  _MoodsScreenState createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen>
    with SingleTickerProviderStateMixin {
  double moodRating = 2;
  IconData moodIcon = Entypo.emoji_happy;
  String moodText = 'Pretty Good';
  bool isInitial = true;
  bool isFirstPage = true;
  int currentPageIndex = 1;
  String secondText = '';

  PageController _pageController = PageController();
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
    _scaleAnimation = Tween<double>(begin: -0.5, end: 1.1).animate(
      CurvedAnimation(
        curve: Curves.elasticOut,
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
      height: device.height * .95,
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
      child: Column(
        children: [
          Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(.6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstPage = !isFirstPage;
                  });
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isFirstPage ? AntDesign.calendar : Feather.arrow_left,
                      color: Colors.white.withOpacity(.5),
                      size: 25,
                    ),
                  ),
                ),
              ),
              ScaleTransition(
                scale: _scaleAnimation,
                child: AvatarGlow(
                  endRadius: 65.0,
                  glowColor: Colors.white,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 4000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: Material(
                    elevation: 20.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Image.asset('assets/images/reflectly_face.gif'),
                      radius: 32,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Feather.x,
                      color: Colors.white.withOpacity(.5),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                buildColumn1(context, mainTileData),
                buildColumn2(mainTileData, secondText),
                buildColumn3(mainTileData, secondText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumn3(mainTileData, secondText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            FadeInUp(
              from: 50,
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '... and how are you feeling about this?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            FadeInUp(
              from: 50,
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Select upto 10 feelings'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(.2),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        ElasticIn(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 600),
          // scale: _scaleAnimation,
          child: InkWell(
            splashColor: Colors.white.withOpacity(.6),
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 90.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
              child: Text(
                'Complete',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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

  Column buildColumn2(MainTileData mainTileData, String secondText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            FadeInUp(
              from: 50,
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Great! What\'s making your ${mainTileData.greet()} pretty good ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            FadeInUp(
              from: 50,
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Select upto 10 activities'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(.2),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        ElasticIn(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 600),
          // scale: _scaleAnimation,
          child: InkWell(
            splashColor: Colors.white.withOpacity(.6),
            onTap: () {
              HapticFeedback.lightImpact();
              _pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 90.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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

  Column buildColumn1(BuildContext context, MainTileData mainTileData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            FadeInUp(
              from: 50,
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Hey, Yash. How are you this ${mainTileData.greet()}?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
              delay: Duration(milliseconds: 1300),
              duration: Duration(milliseconds: 400),
              child: Slider(
                min: 0,
                max: 3,
                divisions: 3,
                label: '${(moodRating + 1).toStringAsFixed(0)}',
                activeColor: Theme.of(context).colorScheme.secondary,
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
                      secondText = data[1];
                    },
                  );
                },
              ),
            ),
          ],
        ),
        ElasticIn(
          delay: const Duration(milliseconds: 1500),
          duration: const Duration(milliseconds: 600),
          // scale: _scaleAnimation,
          child: InkWell(
            splashColor: Colors.white.withOpacity(.6),
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() {
                isFirstPage = !isFirstPage;
              });
              _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 90.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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
        duration: Duration(milliseconds: 500),
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
        from: 25,
        delay: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 500),
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
