import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../providers/memoriesTile_data.dart';
import '../widgets/memories_tile.dart';

class MemoriesScreen extends StatefulWidget {
  static const routeName = '/memories';

  @override
  _MemoriesScreenState createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  int i = 500;
  @override
  Widget build(BuildContext context) {
    final memoriesTileData =
        Provider.of<MemoriesTileData>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Entypo.chevron_down),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.grey.withOpacity(.8),
          iconSize: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Hero(
                  tag: 'Reflectly_face',
                  child: AvatarGlow(
                    endRadius: 90.0,
                    glowColor: Theme.of(context).primaryColor,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 4000),
                    repeatPauseDuration: const Duration(milliseconds: 300),
                    child: Material(
                      elevation: 10.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        child: Image.asset('assets/images/reflectly_face.gif'),
                        radius: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimationConfiguration.staggeredList(
                        position: 1,
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 400),
                        child: SlideAnimation(
                          verticalOffset: -20.0,
                          child: FadeInAnimation(
                            child: Text(
                              '${DateFormat.MMMM().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())}',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.withOpacity(.6),
                                    blurRadius: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 1,
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 400),
                        child: SlideAnimation(
                          horizontalOffset: -50.0,
                          child: FadeInAnimation(
                            child: Text(
                              '2020',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: memoriesTileData.items.map((cur) {
                i = i + 400;
                return FadeIn(
                  duration: const Duration(milliseconds: 200),
                  delay: Duration(milliseconds: i),
                  child: FadeIn(
                    child: MemoriesTile(
                      subTitle: cur.subTitle,
                      title: cur.title,
                      backIcon: cur.backIcon,
                      iconList: cur.iconList,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
