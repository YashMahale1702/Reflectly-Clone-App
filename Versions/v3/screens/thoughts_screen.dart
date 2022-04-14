import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/thoughts_data.dart';
import '../widgets/thoughts.dart';

class ThoughtsScreen extends StatelessWidget {
  static const routeName = '/thoughts';

  @override
  Widget build(BuildContext context) {
    final thoughtsData = Provider.of<ThoughtsData>(context, listen: false);

    return Scaffold(
      body: PageView(
        children: thoughtsData.items.map((cur) {
          return Thoughts(
            source: cur.source,
            author: cur.author,
            thought: cur.thought,
          );
        }).toList(),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
