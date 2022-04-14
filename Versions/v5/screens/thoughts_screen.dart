import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: PageView(
        scrollDirection: Axis.vertical,
        allowImplicitScrolling: true,
        dragStartBehavior: DragStartBehavior.down,
        children: thoughtsData.items.map((cur) {
          return Thoughts(
            blurhash: cur.blurhash,
            source: cur.source,
          );
        }).toList(),
      ),
    );
  }
}

// body: SimpleGestureDetector(
//         onVerticalSwipe: (direction) {
//           if (direction == SwipeDirection.up) {
//             index++;
//             thought = thoughtsData.items[index].thought;
//             print(index);
//             print(thought);
//           }
//         },
//         child: Stack(
//           children: [
//             BlurHash(
//               hash: 'LiI;JzNEWAWUxyWYofj]0cawofax',
//               image:
//                   'https://images.unsplash.com/photo-1517504734587-2890819debab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//               imageFit: BoxFit.cover,
//               decodingHeight: MediaQuery.of(context).size.height.toInt(),
//               decodingWidth: MediaQuery.of(context).size.width.toInt(),
//               curve: Curves.fastLinearToSlowEaseIn,
//               onReady: () {},
//             ),
//             // Image.asset(
//             //   'assets/images/clouds.jpg',
//             //   fit: BoxFit.fitHeight,
//             // ),
//             Positioned(
//               top: 60,
//               left: 20,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Icon(
//                     Entypo.chevron_left,
//                     color: Colors.white.withOpacity(.9),
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                     color: Colors.grey.withOpacity(.15),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               child: Icon(
//                 FontAwesome.quote_left,
//                 color: Colors.white.withOpacity(.5),
//                 size: 50,
//               ),
//               top: (MediaQuery.of(context).size.height * .3) + 90,
//               left: 25,
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: (MediaQuery.of(context).size.height * .3) + 90,
//               ),
//               padding: EdgeInsets.all(25),
//               child: Text(
//                 thought,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   wordSpacing: 1.6,
//                   height: 1.6,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: (MediaQuery.of(context).size.height * .3) + 240,
//               ),
//               padding: EdgeInsets.all(40),
//               width: double.infinity,
//               child: Text(
//                 '------   Author   ------ ',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   fontStyle: FontStyle.italic,
//                   wordSpacing: 1.6,
//                   height: 1.6,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               right: 20,
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Icon(
//                   Feather.share,
//                   color: Colors.white.withOpacity(.9),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   color: Colors.white.withOpacity(.15),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               left: 20,
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     Icon(
//                       AntDesign.filter,
//                       color: Colors.white.withOpacity(.9),
//                     ),
//                     Text(
//                       'All categories',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(.9),
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   color: Colors.white.withOpacity(.15),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
