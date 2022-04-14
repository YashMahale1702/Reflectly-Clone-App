import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../screens/promotion_screen.dart';

class MainTileUpdated extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;
  final IconData icon;

  MainTileUpdated({
    this.color1,
    this.color2,
    this.icon,
    this.subTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, top: 10, right: 5, left: 5),
      padding: const EdgeInsets.only(left: 25, bottom: 25, top: 25, right: 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: color1,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              3.0, // Move to right 10  horizontally
              3.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '$subTitle',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '$title'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(.3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PromotionScreen.routeName);
                        },
                        child: Icon(
                          AntDesign.arrowright,
                          color: Colors.black.withOpacity(.3),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.black.withOpacity(.1),
//             maxRadius: 25,
//             minRadius: 20,
//             child: Icon(
//               icon,
//               color: Colors.white.withOpacity(.8),
//               size: 23,
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     '$title'.toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black.withOpacity(.3),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).pushNamed(MoodsScreen.routeName);
//                     },
//                     child: Icon(
//                       AntDesign.arrowright,
//                       color: Colors.black.withOpacity(.3),
//                       size: 25,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 '$subTitle'.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
