import 'package:custom_app/providers/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PromotionScreen extends StatefulWidget {
  static const routeName = '/promotion';

  @override
  _PromotionScreenState createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  var dly = 300;
  var dur = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 320,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 40.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2,
                      90,
                    ),
                    bottomRight: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2,
                      90,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Feather.x,
                              color: Colors.white.withOpacity(.8),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(.15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FadeIn(
                      child: Hero(
                        tag: 'Reflectly_face',
                        child: AvatarGlow(
                          endRadius: 65.0,
                          glowColor: Colors.white,
                          curve: Curves.linear,
                          duration: Duration(milliseconds: 4000),
                          repeatPauseDuration:
                              const Duration(milliseconds: 300),
                          child: Material(
                            elevation: 20.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              child: Image.asset(
                                  'assets/images/reflectly_face.gif'),
                              radius: 43,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Become 38% Happier with Premium Subscription',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(.8),
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              FadeInUp(
                delay: Duration(milliseconds: dly + 100),
                duration: Duration(milliseconds: dur),
                child: Column(
                  children: [
                    Text(
                      'What\'s in it for you'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              FadeInUp(
                delay: Duration(milliseconds: dly + 200),
                duration: Duration(milliseconds: dur),
                child: Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    // color: Theme.of(context).accentColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListView(
                    children: [
                      buildTiles(
                        'Get to know yourself better',
                        'with refectly insights, you\'ll quickly understand what makes you happy',
                        context,
                      ),
                      buildTiles(
                        'Reduce stress',
                        'with refectly insights, you\'ll quickly understand what makes you happy',
                        context,
                      ),
                      buildTiles(
                        'Easy to use',
                        'with refectly insights, you\'ll quickly understand what makes you happy',
                        context,
                      ),
                    ],
                  ),
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: dly + 400),
                duration: Duration(milliseconds: dur),
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
      ),
    );
  }
}

Widget buildTiles(String title, String subtitle, context) {
  return ListTile(
    dense: false,
    isThreeLine: true,
    leading: Icon(
      Feather.check,
      color: Theme.of(context).primaryColor,
      size: 30,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Variables.titleColor,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Variables.subTitleColor,
      ),
    ),
  );
}
