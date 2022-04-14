import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/thoughts_data.dart';
import '../widgets/thoughts.dart';

class ThoughtsScreen extends StatefulWidget {
  static const routeName = '/thoughts';

  @override
  _ThoughtsScreenState createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ThoughtsData>(context, listen: false)
        .getImageDatas('Nature', '1');
  }

  @override
  Widget build(BuildContext context) {
    ThoughtsData thoughtsData = Provider.of<ThoughtsData>(context);

    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: thoughtsData.imagesItems.length,
          itemBuilder: (context, index) {
            return Thoughts(
              source: thoughtsData.imagesItems[index].source,
              blurhash: thoughtsData.imagesItems[index].blurhash,
              author: thoughtsData.thoughtsItems[0].author,
              thought: thoughtsData.thoughtsItems[0].thought,
            );
          },
          options: CarouselOptions(
            viewportFraction: .8,
            height: MediaQuery.of(context).size.height * .75,
            enlargeCenterPage: true,
            aspectRatio: 1.5,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
