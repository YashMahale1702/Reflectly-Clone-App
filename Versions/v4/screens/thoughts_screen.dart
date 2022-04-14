import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../providers/thoughts_data.dart';
import '../widgets/thoughts.dart';

class ThoughtsScreen extends StatelessWidget {
  static const routeName = '/thoughts';

  @override
  Widget build(BuildContext context) {
    final thoughtsData = Provider.of<ThoughtsData>(context, listen: false);

    return Scaffold(
      body: PreloadPageView(
        children: thoughtsData.items.map((cur) {
          return Thoughts(
            source: cur.source,
            author: cur.author,
            thought: cur.thought,
            blurhash: cur.blurhash,
          );
        }).toList(),
        scrollDirection: Axis.vertical,
        preloadPagesCount: 1,
        // physics: BouncingScrollPhysics(),
      ),
    );
  }
}
