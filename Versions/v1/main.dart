import 'package:flutter/material.dart';

import './screens/next_screen.dart';
import './screens/home_screen.dart';
import './screens/memories_screen.dart';
import './helpers/custom_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflects You',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff549bc9),
        accentColor: Color(0xff7599f5),
        scaffoldBackgroundColor: Color(0xfff2f7fb),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          },
        ),
      ),
      home: HomeScreen(),
      routes: {
        NextScreen.routeName: (_) => NextScreen(),
        MemoriesScreen.routeName: (_) => MemoriesScreen(),
      },
    );
  }
}
