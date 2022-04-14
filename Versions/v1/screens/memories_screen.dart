import 'package:flutter/material.dart';

class MemoriesScreen extends StatelessWidget {
  static const routeName = '/memories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Here Goes Thoughts'),
        ),
      ),
    );
  }
}
