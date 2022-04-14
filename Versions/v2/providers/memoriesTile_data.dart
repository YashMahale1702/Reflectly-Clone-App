import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MemoriesTileData with ChangeNotifier {
  List<MemoriesTileModel> _items = [
    MemoriesTileModel(
      backIcon: AntDesign.gift,
      iconList: [
        AntDesign.home,
        Ionicons.ios_headset,
        SimpleLineIcons.badge,
        MaterialCommunityIcons.sofa,
        MaterialCommunityIcons.emoticon_sad_outline,
        MaterialIcons.people_outline
      ],
      title: 'Completely Okay',
    ),
    MemoriesTileModel(
      backIcon: AntDesign.gift,
      iconList: [
        SimpleLineIcons.badge,
        AntDesign.home,
        MaterialCommunityIcons.sofa,
        MaterialCommunityIcons.emoticon_sad_outline,
        Ionicons.ios_headset,
        MaterialIcons.event,
      ],
      title: 'Seems Fine',
    ),
    MemoriesTileModel(
      backIcon: AntDesign.gift,
      iconList: [
        MaterialCommunityIcons.emoticon_sad_outline,
        Ionicons.ios_headset,
        MaterialCommunityIcons.sofa,
        SimpleLineIcons.badge,
        AntDesign.home,
      ],
      title: 'Feeling Depressed',
    ),
    MemoriesTileModel(
      backIcon: AntDesign.gift,
      iconList: [
        MaterialCommunityIcons.emoticon_sad_outline,
        MaterialCommunityIcons.sofa,
        AntDesign.home,
        Entypo.emoji_sad,
      ],
      title: 'Somewhat Sad',
    ),
  ];
  List<MemoriesTileModel> get items {
    return [..._items];
  }
}

class MemoriesTileModel {
  final List<IconData> iconList;
  final IconData backIcon;
  final String title;
  final String subTitle;

  MemoriesTileModel({
    this.iconList,
    this.backIcon,
    this.subTitle,
    this.title,
  });
}
