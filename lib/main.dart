//This is working

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import './screens/home_screen.dart';
import './screens/memories_screen.dart';
import './screens/thoughts_screen.dart';
import './screens/promotion_screen.dart';
import './screens/user_profile_screen.dart';
import './screens/moods_screen.dart';
import './screens/settings.dart';

import './helpers/custom_route.dart';

import './providers/mainTile_data.dart';
import './providers/memoriesTile_data.dart';
import './providers/thoughts_data.dart';
import './providers/moods_data.dart';

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
        ChangeNotifierProvider(
          create: (context) => MoodsData(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Reflects You',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // colorScheme: ColorScheme(brightness: Brightness.light, primary: Color(0xff549bc9), onPrimary: onPrimary, secondary: Color(0xfff2f7fb), onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
              // primaryColor: Color(0xff549bc9),
              // accentColor: Color(0xff7599f5),
              colorSchemeSeed: Color(0xff549bc9),
              scaffoldBackgroundColor: Color(0xfff2f7fb),
              fontFamily: 'Quicksand',
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
              UserProfileScreen.routeName: (_) => UserProfileScreen(),
              SettingsScreen.routeName: (_) => SettingsScreen(),
              MoodsScreen.routeName: (_) => MoodsScreen(),
            },
          );
        },
      ),
    );
  }
}
