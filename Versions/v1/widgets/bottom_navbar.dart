import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
        TabItem(icon: AntDesign.home, title: ''),
        TabItem(icon: Entypo.quote, title: ''),
        TabItem(icon: MaterialIcons.person_outline, title: ''),
      ],
      height: 60,
      initialActiveIndex: 2, //optional, default as 0
      onTap: (int i) => print('click index=$i'),
      cornerRadius: 25.0,
      curve: Curves.fastLinearToSlowEaseIn,
      backgroundColor: Colors.white,
      style: TabStyle.fixedCircle,
      elevation: 8.0,
      color: Theme.of(context).primaryColor.withOpacity(.6),
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
