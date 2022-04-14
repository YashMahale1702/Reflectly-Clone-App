import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/memories_screen.dart';
import './screens/thoughts_screen.dart';
import './screens/promotion_screen.dart';
import './helpers/custom_route.dart';

import './providers/mainTile_data.dart';
import './providers/memoriesTile_data.dart';
import './providers/thoughts_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainTileData(),
        ),
        ChangeNotifierProvider(
          create: (context) => MemoriesTileData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThoughtsData(),
        ),
      ],
      child: MaterialApp(
        title: 'Reflects You',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff549bc9),
          accentColor: Color(0xff7599f5),
          scaffoldBackgroundColor: Color(0xfff2f7fb),
          fontFamily: 'Monserrat',
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        home: HomeScreen(),
        routes: {
          MemoriesScreen.routeName: (_) => MemoriesScreen(),
          ThoughtsScreen.routeName: (_) => ThoughtsScreen(),
          PromotionScreen.routeName: (_) => PromotionScreen(),
        },
      ),
    );
  }
}
