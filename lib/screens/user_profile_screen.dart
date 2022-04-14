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
        // bottomNavigationBar: Bottom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeInUp(
                from: 50,
                duration: const Duration(milliseconds: 400),
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
                from: 50,
                duration: const Duration(milliseconds: 400),
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
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, top: 40.0, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: theme.primaryColor.withOpacity(.6),
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
                  child: Stack(
                    children: [
                      Positioned(
                        child: Icon(
                          FontAwesome.unlock_alt,
                          color: Colors.black.withOpacity(.1),
                          size: 150,
                        ),
                        top: -20,
                        left: 0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 30.0),
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
                    ],
                  ),
                ),
              ),
              FadeInUp(
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  height: 440,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .8,
                    ),
                    children: [
                      gridWidget(
                        theme,
                        device,
                        'Rate refectly 5-stars',
                        'Rate',
                        Feather.star,
                        Colors.white,
                        [
                          theme.primaryColor,
                          theme.colorScheme.secondary,
                        ],
                        theme.primaryColor,
                        Colors.white,
                      ),
                      gridWidget(
                        theme,
                        device,
                        'start buiding great habits',
                        'Habits',
                        AntDesign.calendar,
                        theme.primaryColor,
                        [
                          Colors.white,
                          Colors.white,
                        ],
                        Colors.grey,
                        Colors.black.withOpacity(.8),
                      ),
                      gridWidget(
                        theme,
                        device,
                        'Contact support',
                        'Support',
                        AntDesign.contacts,
                        theme.primaryColor,
                        [
                          Colors.white,
                          Colors.white,
                        ],
                        Colors.grey,
                        Colors.black.withOpacity(.8),
                      ),
                      gridWidget(
                        theme,
                        device,
                        'Give product feedback',
                        'Feedback',
                        AntDesign.rocket1,
                        theme.primaryColor,
                        [
                          Colors.white,
                          Colors.white,
                        ],
                        Colors.grey,
                        Colors.black.withOpacity(.8),
                      ),
                    ],
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

Widget gridWidget(theme, device, String title, String subTitle, IconData icon,
    Color iconColor, List<Color> gradient, Color shadowColor, Color textColor) {
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(20.0),
    width: device.width * .41,
    height: 190,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: shadowColor.withOpacity(.6),
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 0.0, //extend the shadow
          offset: Offset(
            2.0, // Move to right 10  horizontally
            2.0, // Move to bottom 10 Vertically
          ),
        )
      ],
      gradient: LinearGradient(
        colors: [
          gradient[0],
          gradient[1],
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
            subTitle,
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
              icon,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    ),
  );
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

// FadeInUp(
//                 delay: const Duration(milliseconds: 250 + 400),
//                 duration: const Duration(milliseconds: 300),
//                 child: Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 10, bottom: 10, left: 10, right: 20),
//                       padding: const EdgeInsets.all(15.0),
//                       height: 190,
//                       width: device.width * .41,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 10.0, // soften the shadow
//                             spreadRadius: 0.0, //extend the shadow
//                             offset: Offset(
//                               2.0, // Move to right 10  horizontally
//                               3.0, // Move to bottom 10 Vertically
//                             ),
//                           )
//                         ],
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.white,
//                             Colors.white,
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             bottom: 20,
//                             child: Text(
//                               'Support',
//                               style: TextStyle(
//                                 fontSize: 40,
//                                 color: Colors.black.withOpacity(.08),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(
//                                 Ionicons.ios_rocket,
//                                 color: theme.primaryColor,
//                               ),
//                               Text(
//                                 'Contact support',
//                                 style: TextStyle(
//                                   color: Colors.black.withOpacity(.8),
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
