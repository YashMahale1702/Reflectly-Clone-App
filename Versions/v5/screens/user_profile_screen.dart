import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../providers/variables.dart';
import '../screens/settings.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/user-profile';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Color color1 = Color(0xff409cb0);
  Color color2 = Color(0xff7f98e5);

  var dly = 300;
  var dur = 300;

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: device.width / 2 - 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Variables.primaryGreen,
                            Variables.primaryPurple,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 5,
                            left: 5,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Entypo.chevron_left,
                                  color: Colors.white.withOpacity(.8),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // color: Colors.white.withOpacity(.15),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              MaterialCommunityIcons.account_circle_outline,
                              size: 100,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: device.width / 2,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      blurRadius: 10.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        3.0, // Move to right 10  horizontally
                                        3.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(SettingsScreen.routeName);
                                  },
                                  child: Icon(
                                    MaterialIcons.tune,
                                    color: Colors.black.withOpacity(.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2.0,
                            left: 15.0,
                            child: Container(
                              child: Text(
                                'Yash',
                                style: TextStyle(
                                  color: Variables.titleColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300 + 200),
                duration: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildcolumnWidget(2, 'Moments'),
                    buildcolumnWidget(0, 'Photos'),
                    buildcolumnWidget(0, 'Reflections'),
                  ],
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300 + 300),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 30.0),
                  margin: const EdgeInsets.only(
                      bottom: 20, top: 40.0, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: theme.primaryColor,
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          2.0, // Move to right 10  horizontally
                          3.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        color1,
                        color2,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Unlock refectly and become your own hero',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300 + 400),
                duration: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 10),
                      padding: const EdgeInsets.all(20.0),
                      height: 170,
                      width: device.width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: theme.primaryColor,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            theme.primaryColor,
                            theme.accentColor,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            child: Text(
                              'Rate',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black.withOpacity(.08),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Feather.star,
                                color: Colors.white,
                              ),
                              Text(
                                'Rate refectly 5-stars',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 20),
                      padding: const EdgeInsets.all(20.0),
                      height: 170,
                      width: device.width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            child: Text(
                              'Support',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black.withOpacity(.08),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Ionicons.ios_rocket,
                                color: theme.primaryColor,
                              ),
                              Text(
                                'Contact support',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildcolumnWidget(number, title) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white.withOpacity(.35),
    ),
    child: Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            color: Variables.titleColor,
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Variables.subTitleColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildGridItem(
    color1, color2, shadowColor, context, title, back, icon, iconColor) {
  var device = MediaQuery.of(context).size;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
    padding: const EdgeInsets.all(15.0),
    height: 170,
    width: device.width * .38,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 10.0, // soften the shadow
          spreadRadius: 0.0, //extend the shadow
          offset: Offset(
            2.0, // Move to right 10  horizontally
            3.0, // Move to bottom 10 Vertically
          ),
        )
      ],
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 20,
          child: Text(
            back,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black.withOpacity(.08),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Icon(icon)],
        )
      ],
    ),
  );
}
