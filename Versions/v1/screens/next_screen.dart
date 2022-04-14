import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NextScreen extends StatelessWidget {
  static const routeName = '/next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Entypo.chevron_down),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.grey.withOpacity(.8),
          iconSize: 30,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: 'Reflectly_face',
                child: AvatarGlow(
                  endRadius: 90.0,
                  glowColor: Colors.grey,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 4000),
                  repeatPauseDuration: const Duration(milliseconds: 300),
                  child: Material(
                    elevation: 10.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Image.asset('assets/images/reflectly_face.gif'),
                      radius: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
