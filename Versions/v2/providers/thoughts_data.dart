import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ThoughtsData with ChangeNotifier {
  List<ThoughtsModel> _items = [
    ThoughtsModel(
      author: 'Eleanor Roosevelt',
      source:
          'https://images.unsplash.com/photo-1600551790611-583f602428a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'The future belongs to those who believe in the beauty of their dreams.',
    ),
    ThoughtsModel(
      author: 'Elbert Hubbard',
      source:
          'https://images.unsplash.com/photo-1600433944603-20e9723dd8ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'A friend is someone who knows all about you and still loves you.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600663677113-7cac2b512d85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'Love takes off masks that we fear we cannot live without and know we cannot live within.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600636917003-55ab60eb7338?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'Love takes off masks that we fear we cannot live without and know we cannot live within.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600662506905-de95b994a63c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'The most important thing in life is to learn how to give out love, and to let it come in.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1550176533-53a661ad88e3?ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80',
      thought: 'Love will find a way through paths where wolves fear to prey.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600449123465-fef3cb5abbf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought: '... it’s a blessed thing to love and feel loved in return.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1570810775100-b0809c777122?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      thought:
          "Love is like a good cake; you never know when it's coming, but you'd better eat it when it does!",
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600340432559-f1f4d02a3292?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought: 'Tough times don’t last. Tough people do.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1578452171578-a605cb38abe1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80',
      thought:
          'Keep going. Everything you need will come to you at the perfect time.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1555188220-90cc2cad3537?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'You have to be at your strongest when you’re feeling at your weakest.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600673384259-252d51774f4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=650&q=80',
      thought: 'Never give up. Great things take time. Be patient.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600370799735-7c03daccfb8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=653&q=80',
      thought:
          'It does not matter how slowly you go as long as you do not stop',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600358201177-642a15fd6142?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought:
          'You have to be at your strongest when you’re feeling at your weakest.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600356604581-e573833d02e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought: 'Courage is one step ahead of fear.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1581278551025-29d98315ce48?ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80',
      thought:
          'If you feel like giving up, just look back on how far you are already',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600430450133-cd2c5dcc51e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      thought: 'Look in the mirror. That’s your competition.',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1600366776033-ac12647f5a72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=651&q=80',
      thought: 'Everything you’ve ever wanted is on the other side of fear. ',
    ),
    ThoughtsModel(
      author: '',
      source:
          'https://images.unsplash.com/photo-1598948953054-896179750dc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDAxNX0&auto=format&fit=crop&w=633&q=80',
      thought: 'Pain is temporary. Quitting lasts forever.',
    ),
  ];

  List<ThoughtsModel> get items {
    return [..._items];
  }

  Future<void> getAndSetDatas() async {
    const url = 'https://refectly-app.firebaseio.com/thoughts.json';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<ThoughtsModel> _tempData = [];

    extractedData.forEach(
      (key, value) {
        _tempData.add(ThoughtsModel(
          author: value['author'],
          source: value['source'],
          thought: value['thought'],
        ));
      },
    );
    _items = _tempData;

    notifyListeners();
  }
}

class ThoughtsModel {
  final String source;
  final String thought;
  final String author;

  ThoughtsModel({this.author, this.source, this.thought});
}
