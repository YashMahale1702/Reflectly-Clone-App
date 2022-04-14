import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Thoughts extends StatelessWidget {
  final String source;
  final String thought;
  final String author;

  Thoughts({this.source, this.author, this.thought});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ZoomIn(
          delay: const Duration(milliseconds: 200),
          animate: true,
          child: BlurHash(
            hash: 'LKO2?U%2Tw=w]~RBVZRi};RPxuwH',
            image: source,
            imageFit: BoxFit.cover,
            decodingHeight: MediaQuery.of(context).size.height.toInt(),
            decodingWidth: MediaQuery.of(context).size.width.toInt(),
            curve: Curves.fastOutSlowIn,
          ),
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
                color: Colors.white.withOpacity(.8),
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
          top: (MediaQuery.of(context).size.height / 2) + 90,
          left: 25,
        ),
        Container(
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height / 2) + 90,
          ),
          padding: EdgeInsets.all(25),
          child: Text(
            thought,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              wordSpacing: 1.6,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height / 2) + 240,
          ),
          padding: EdgeInsets.all(25),
          width: double.infinity,
          child: Text(
            '-  $author',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              wordSpacing: 1.6,
              height: 1.6,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Feather.share,
              color: Colors.white.withOpacity(.6),
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
