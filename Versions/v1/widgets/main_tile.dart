import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../screens/memories_screen.dart';

class MainTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;
  final IconData icon;

  MainTile({this.color1, this.color2, this.icon, this.subTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0, bottom: 15),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
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
          bottomLeft: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$title'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(.3),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(MemoriesScreen.routeName);
                    },
                    child: Icon(
                      AntDesign.arrowright,
                      color: Colors.black.withOpacity(.3),
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$subTitle'.toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
