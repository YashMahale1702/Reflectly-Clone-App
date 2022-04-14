import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      ClipPath(
                        clipper: MyCustomClipper(),
                        child: Container(
                          height: 320,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.white.withOpacity(.15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ZoomIn(
                                duration: const Duration(milliseconds: 400),
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
                      SizedBox(
                        height: 8,
                      ),
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
                      CarouselSlider(
                        items: [
                          carouselWidget(),
                          carouselWidget(),
                          carouselWidget(),
                          carouselWidget(),
                        ],
                        options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: false,
                          enableInfiniteScroll: false,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: ElasticIn(
                        delay: Duration(milliseconds: dly + 600),
                        duration: Duration(milliseconds: 600),
                        child: GestureDetector(
                          onTap: () {
                            // navigator
                          },
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 69),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 90.0,
                              vertical: 15.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                              ),
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget carouselWidget() {
  final String review1 =
      'Reflectly has been amazing. I am writing in the app every day, and it has given me some insight as to various things about myself i didn\'t know about.';

  return Container(
    padding: const EdgeInsets.all(30.0),
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.25),
          offset: Offset(0, 5),
          blurRadius: 20,
        )
      ],
    ),
    child: Text(
      review1,
      style: TextStyle(
        color: Colors.black.withOpacity(.8),
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget buildTiles(String title, String subtitle, context) {
  return FadeInUp(
    delay: Duration(milliseconds: 300 + 200),
    duration: Duration(milliseconds: 300),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: ListTile(
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
            color: Colors.black.withOpacity(.9),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
