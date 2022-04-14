import 'package:custom_app/screens/promotion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;
  final IconData icon;

  MainTile({
    this.color1,
    this.color2,
    this.icon,
    this.subTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0, bottom: 15),
      padding: const EdgeInsets.only(left: 25, bottom: 20, top: 20, right: 10),
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.1),
            maxRadius: 25,
            minRadius: 20,
            child: Icon(
              icon,
              color: Colors.white.withOpacity(.8),
              size: 23,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$title'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: (context) {
                      //     return MoodsScreen();
                      //   },
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(35.0),
                      //       topRight: Radius.circular(35.0),
                      //     ),
                      //   ),
                      // );
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
              SizedBox(
                height: 5,
              ),
              Text(
                '$subTitle'.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
