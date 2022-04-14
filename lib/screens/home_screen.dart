import 'package:custom_app/widgets/memories_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import '../providers/memoriesTile_data.dart';
import '../providers/variables.dart';
import '../providers/mainTile_data.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/main_tile.dart';
import '../widgets/main_tile_updated.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 700;
  String greetText = '';

  @override
  Widget build(BuildContext context) {
    final memoriesTileData =
        Provider.of<MemoriesTileData>(context, listen: false);
    final mainTileData = Provider.of<MainTileData>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: FadeInUpBig(
        child: Bottom(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      from: 30,
                      child: Text(
                        'Good ${mainTileData.greet()},',
                        style: TextStyle(
                          color: Variables.subTitleColor,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Variables.subTitleColor,
                              blurRadius: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                      animate: true,
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 250),
                      from: 30,
                      child: Text(
                        'Yash',
                        style: TextStyle(
                          color: Variables.titleColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //* carosel
              FadeInRight(
                duration: const Duration(milliseconds: 700),
                delay: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  items: mainTileData.items.map((cur) {
                    return MainTileUpdated(
                      color1: cur.color1,
                      color2: cur.color2,
                      icon: cur.icon,
                      subTitle: cur.subTitle,
                      title: cur.title,
                      backIcon: cur.backicon,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    // height: MediaQuery.of(context).size.height * 0.27,
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 250 + 800),
                      duration: const Duration(milliseconds: 300),
                      from: 30,
                      child: Text(
                        '${DateFormat.d().format(DateTime.now())}. ${DateFormat.MMMM().format(DateTime.now())}'
                            .toUpperCase(),
                        style: TextStyle(
                          color: Variables.titleColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(.6),
                              blurRadius: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                      animate: true,
                      duration: const Duration(milliseconds: 300),
                      delay: const Duration(milliseconds: 250 + 1000),
                      from: 30,
                      child: Text(
                        DateFormat.y().format(DateTime.now()).toString(),
                        style: TextStyle(
                          color: Variables.subTitleColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: memoriesTileData.mainTileItems.map((cur) {
                  i = i + 300;
                  return FadeInRight(
                    duration: const Duration(milliseconds: 600),
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
              SizedBox(
                height: 200,
              ),
              Column(
                children: mainTileData.items.map((cur) {
                  i = i + 350;
                  return FadeInRight(
                    duration: const Duration(milliseconds: 450),
                    delay: Duration(milliseconds: i + 200),
                    child: ZoomIn(
                      child: MainTile(
                        color1: cur.color1,
                        color2: cur.color2,
                        icon: cur.icon,
                        subTitle: cur.subTitle,
                        title: cur.title,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemBuilder: (context, index) {
//     i = i + 350;
//     return FadeInRight(
//       duration: const Duration(milliseconds: 450),
//       delay: Duration(milliseconds: i + 200),
//       child: ZoomIn(
//         child: MainTileUpdated(
//           color1: mainTileData.items[index].color1,
//           color2: mainTileData.items[index].color1,
//           icon: mainTileData.items[index].icon,
//           subTitle: mainTileData.items[index].subTitle,
//           title: mainTileData.items[index].title,
//         ),
//       ),
//     );
//   },
//   itemCount: mainTileData.items.length,
// ),