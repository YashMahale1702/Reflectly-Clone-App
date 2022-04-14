import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Thoughts extends StatefulWidget {
  final String source;
  final String thought;
  final String author;
  final String blurhash;

  // AnimationController _animationController;

  Thoughts({this.source, this.author, this.thought, this.blurhash});

  @override
  _ThoughtsState createState() => _ThoughtsState();
}

class _ThoughtsState extends State<Thoughts> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //* Navigate to next screen
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BlurHash(
              hash: widget.blurhash,
              image: widget.source,
              imageFit: BoxFit.cover,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 800),
            ),
          ),
          Positioned(
            top: 5.w,
            left: 5.w,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Entypo.chevron_left,
                  color: Colors.white.withOpacity(.9),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.withOpacity(.15),
                ),
              ),
            ),
          ),
          Positioned(
            child: Icon(
              FontAwesome.quote_left,
              color: Colors.white.withOpacity(.5),
              size: 50,
            ),
            top: 25.h,
            left: 5.w,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 26.h,
            ),
            padding: EdgeInsets.all(25),
            child: Text(
              '${widget.thought}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height * .3) + 100,
            ),
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: Text(
              ' ----- ${widget.author}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Positioned(
            bottom: 5.w,
            right: 5.w,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                child: Icon(
                  isFav ? AntDesign.heart : AntDesign.hearto,
                  color: Colors.white.withOpacity(.9),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(.15),
              ),
            ),
          ),
          Positioned(
            bottom: 5.w,
            left: 5.w,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    AntDesign.filter,
                    color: Colors.white.withOpacity(.9),
                  ),
                  Text(
                    'All categories',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
