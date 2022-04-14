import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../screens/thoughts_screen.dart';
import '../screens/memories_screen.dart';
import '../screens/promotion_screen.dart';
import '../screens/home_screen.dart';

// import '../providers/thoughts_data.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    // final thoughtsData = Provider.of<ThoughtsData>(context);

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      style: TabStyle.fixedCircle,
      elevation: 6.0,
      color: Theme.of(context).primaryColor.withOpacity(.6),
      activeColor: Theme.of(context).accentColor,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
        if (index == 1) {
          Navigator.of(context).pushNamed(MemoriesScreen.routeName);
        }
        if (index == 2) {
          Navigator.of(context).pushNamed(PromotionScreen.routeName);
        }
        if (index == 3) {
          // thoughtsData.getAndSetDatas();
          Navigator.of(context).pushNamed(ThoughtsScreen.routeName);
        }
      },
    );
  }
}
