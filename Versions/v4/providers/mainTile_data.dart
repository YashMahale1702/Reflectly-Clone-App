import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class MainTileData with ChangeNotifier {
  List<TileModel> _items = [
    TileModel(
      title: 'Daily Reflection',
      subTitle: 'Memories',
      color1: Color(0xff3f9cad),
      color2: Color(0xff7599f5),
      icon: MaterialCommunityIcons.meteor,
    ),
    TileModel(
      title: 'Morning Motivation',
      subTitle: 'Inspiration',
      color1: Color(0xfffda085),
      color2: Color(0xfff6d365),
      icon: Feather.sunrise,
    ),
    TileModel(
      title: 'Morning Motivation',
      subTitle: ' Self-Love',
      color1: Color(0xffa18cd1),
      color2: Color(0xfffbc2eb),
      icon: Ionicons.ios_happy,
    ),
    TileModel(
      title: 'Morning Motivation',
      subTitle: 'Start Today',
      color1: Color(0xff8fd3f4),
      color2: Color(0xff84fab0),
      icon: MaterialCommunityIcons.human_greeting,
    ),
    TileModel(
      title: 'Morning Motivation',
      subTitle: 'Start Today',
      color2: Color(0xffc2e9fb),
      color1: Color(0xffa1c4fd),
      icon: AntDesign.staro,
    ),
    // TileModel(
    //   title: 'Morning Motivation',
    //   subTitle: 'Start Today',
    //   color1: Color(0xfff5576c),
    //   color2: Color(0xfff093fb),
    //   icon: Feather.cloud,
    // ),
  ];

  List<TileModel> get items {
    return [..._items];
  }

  String greet() {
    int now = int.parse(DateFormat.H().format(DateTime.now()));
    print(now);
    String greetText = '';
    if (now >= 5 && now <= 12) {
      greetText = 'morning';
    }
    if (now >= 13 && now <= 16) {
      greetText = 'afternoon';
    }
    if (now >= 17 && now <= 19) {
      greetText = 'evening';
    }
    if (now >= 20 && now <= 24 || now >= 1 && now <= 4) {
      greetText = 'night';
    }
    // notifyListeners();
    return greetText;
  }

  List moodChange(moodValue) {
    List moodData = [];
    if (moodValue == 0.0) {
      moodData = [Entypo.emoji_sad, 'Really Terrible'];
    }
    if (moodValue == 1.0) {
      moodData = [Entypo.emoji_neutral, 'Completely Okay'];
    }
    if (moodValue == 2.0) {
      moodData = [Entypo.emoji_happy, 'Pretty Good'];
    }
    if (moodValue == 3.0) {
      moodData = [Entypo.emoji_flirt, 'Super Awesome'];
    }

    notifyListeners();
    return moodData;
  }
}

class TileModel {
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;
  final IconData icon;

  TileModel({this.color1, this.color2, this.icon, this.subTitle, this.title});
}
