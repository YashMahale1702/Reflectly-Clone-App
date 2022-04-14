import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MemoriesTile extends StatelessWidget {
  final List<IconData> iconList;
  final IconData backIcon;
  final String title;
  final String subTitle;

  MemoriesTile({
    this.backIcon,
    this.iconList,
    this.subTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title.toString()),
      direction: DismissDirection.endToStart,
      background: IconButton(
        icon: Icon(
          MaterialCommunityIcons.delete,
          size: 40,
          color: Colors.red,
        ),
        onPressed: () {},
        alignment: Alignment.centerRight,
        color: Colors.blue,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 80, bottom: 15),
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                3.0, // Move to right 10  horizontally
                3.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xfffdfbfb),
              Color(0xffebedee),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Icon(
                backIcon,
                color: Colors.grey.withOpacity(0.15),
                size: 60,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat.jm().format(DateTime.now()).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: iconList.map(
                            (cur) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  cur,
                                  color: Colors.black.withOpacity(0.3),
                                  size: 20,
                                ),
                              );
                            },
                          ).toList(),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//
