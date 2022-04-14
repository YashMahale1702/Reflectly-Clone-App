import 'package:custom_app/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../screens/thoughts_screen.dart';
import '../screens/memories_screen.dart';
import '../screens/home_screen.dart';
import '../screens/moods_screen.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: MaterialIcons.content_copy, title: ''),
        TabItem(icon: Ionicons.ios_analytics, title: ''),
        TabItem(icon: Icons.add, title: '', isIconBlend: true),
        TabItem(icon: Entypo.quote, title: ''),
        TabItem(icon: MaterialIcons.person_outline, title: ''),
      ],
      height: 55,
      initialActiveIndex: 2,
      cornerRadius: 30.0,
      curve: Curves.fastLinearToSlowEaseIn,
      backgroundColor: Colors.white,
      style: TabStyle.fixedCircle,
      elevation: 6.0,
      color: Theme.of(context).primaryColor.withOpacity(.6),
      activeColor: Theme.of(context).primaryColor,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
        if (index == 1) {
          Navigator.of(context).pushNamed(MemoriesScreen.routeName);
        }
        if (index == 2) {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return MoodsScreen();
            },
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
          );
        }
        if (index == 3) {
          // thoughtsData.getAndSetDatas();
          Navigator.of(context).pushNamed(ThoughtsScreen.routeName);
        }
        if (index == 4) {
          // thoughtsData.getAndSetDatas();
          Navigator.of(context).pushNamed(UserProfileScreen.routeName);
        }
      },
    );
  }
}
