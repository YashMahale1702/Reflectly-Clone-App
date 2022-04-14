import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Thoughts extends StatelessWidget {
  final String source;
  final String thought;
  final String author;
  final String blurhash;

  // AnimationController _animationController;

  Thoughts({this.source, this.author, this.thought, this.blurhash});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurHash(
          hash: blurhash,
          image: source,
          imageFit: BoxFit.cover,
          decodingHeight: MediaQuery.of(context).size.height.toInt(),
          decodingWidth: MediaQuery.of(context).size.width.toInt(),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 600),
          onReady: () {},
        ),
        Positioned(
          top: 60,
          left: 20,
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
          top: (MediaQuery.of(context).size.height * .3) + 90,
          left: 25,
        ),
        Container(
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height * .3) + 90,
          ),
          padding: EdgeInsets.all(25),
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              wordSpacing: 1.6,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height * .3) + 240,
          ),
          padding: EdgeInsets.all(40),
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              wordSpacing: 1.6,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Feather.share,
              color: Colors.white.withOpacity(.9),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white.withOpacity(.15),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
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
    );
  }
}
