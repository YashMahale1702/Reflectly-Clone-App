import 'package:custom_app/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../screens/thoughts_screen.dart';
import '../screens/memories_screen.dart';
import '../screens/home_screen.dart';
import '../screens/moods_screen.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: MaterialIcons.content_copy, title: ''),
        TabItem(icon: SimpleLineIcons.graph, title: ''),
        TabItem(icon: Icons.add, title: ''),
        TabItem(icon: Entypo.quote, title: ''),
        TabItem(icon: MaterialIcons.person_outline, title: ''),
      ],
      height: 55,
      initialActiveIndex: 2,
      cornerRadius: 30.0,
      curve: Curves.elasticIn,
      backgroundColor: Colors.white,
      style: TabStyle.fixedCircle,
      elevation: 6.0,
      color: Color(0xff5d9bd4).withOpacity(.6),
      activeColor: Color(0xff5d9bd4),
      onTap: (index) {
        switch (index) {
          case 0:
            HapticFeedback.lightImpact();
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            break;
          case 1:
            HapticFeedback.lightImpact();
            Navigator.of(context).pushNamed(MemoriesScreen.routeName);
            break;
          case 2:
            HapticFeedback.lightImpact();
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return MoodsScreen();
              },
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              enableDrag: true,
            );
            break;
          case 3:
            HapticFeedback.lightImpact();
            Navigator.of(context).pushNamed(ThoughtsScreen.routeName);
            break;
          case 4:
            HapticFeedback.lightImpact();
            Navigator.of(context).pushNamed(UserProfileScreen.routeName);
            break;
        }
      },
    );
  }
}

//if (index == 0) {
//   Navigator.of(context).pushNamed(HomeScreen.routeName);
// }
// if (index == 1) {
//   Navigator.of(context).pushNamed(MemoriesScreen.routeName);
// }
// if (index == 2) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return MoodsScreen();
//     },
//     isScrollControlled: true,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(35.0),
//         topRight: Radius.circular(35.0),
//       ),
//     ),
//   );
// }
// if (index == 3) {
//   // thoughtsData.getAndSetDatas();
//   Navigator.of(context).pushNamed(ThoughtsScreen.routeName);
// }
// if (index == 4) {
//   // thoughtsData.getAndSetDatas();
//   Navigator.of(context).pushNamed(UserProfileScreen.routeName);
// }
