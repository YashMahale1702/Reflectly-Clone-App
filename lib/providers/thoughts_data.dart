import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThoughtsData with ChangeNotifier {
  List<ThoughtModel> _thoughtItems = [];

  List<ThoughtModel> get thoughtItems {
    return [..._thoughtItems];
  }

  List<QuotesModel> _quotesItems;

  List<QuotesModel> get quotesItems {
    return [..._quotesItems];
  }

  Future<void> getImageDatas(String query, String page) async {
    const accessCode = '2ElhymHwS8YSIKWg_nlAUdPXh1Zaow8R3WhaBJZB3FM';

    try {
      final List<QuotesModel> tempQuoteItems = [];

      final url = 'https://zenquotes.io/api/quotes';
      final response = await http.get(Uri.parse(url));
      final List extractedData = json.decode(response.body);
      print(extractedData);

      extractedData.forEach((cur) {
        tempQuoteItems.add(
          QuotesModel(
            author: cur['a'],
            thought: cur['q'],
          ),
        );
      });

      _quotesItems = tempQuoteItems;
    } catch (error) {
      throw error;
    }

    try {
      final List<ThoughtModel> tempThoughtItems = [];

      final url =
          'https://api.unsplash.com/search/photos.json?&per_page=30&query=$query&client_id=$accessCode&page=1&orientation=portrait';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      final extractedData = data['results'];

      int i;

      for (i = 0; i < 30; i++) {
        var curImage = extractedData[i];
        var curQuote = _quotesItems[i];
        tempThoughtItems.add(
          ThoughtModel(
            source: curImage['urls']['regular'],
            blurhash: curImage['blur_hash'],
            author: curQuote.author,
            thought: curQuote.thought,
          ),
        );
      }

      _thoughtItems = tempThoughtItems;
      print('${_thoughtItems.length} \n$_thoughtItems');

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

class ThoughtModel {
  final String source;
  final String blurhash;
  final String author;
  final String thought;
  ThoughtModel({
    @required this.source,
    @required this.blurhash,
    @required this.author,
    @required this.thought,
  });
}

class QuotesModel {
  final String author;
  final String thought;
  QuotesModel({
    @required this.author,
    @required this.thought,
  });
}

// ImagesModel(
//       author: 'Eleanor Roosevelt',
//       source:
//           'https://images.unsplash.com/photo-1494783367193-149034c05e8f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//       thought:
//           'The future belongs to those who believe in the beauty of their dreams.',
//       blurhash: 'LmBqMNaysmofYRayazfkE,aeS2a|',
//     ),
//     ImagesModel(
//         author: 'Elbert Hubbard',
//         source:
//             'https://images.unsplash.com/photo-1500485035595-cbe6f645feb1?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//         thought:
//             'A friend is someone who knows all about you and still loves you.',
//         blurhash: 'LzHC7xWXIojst:jso1a}0\$n%sofk'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/photo-1514125669375-59ee3985d08b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
//         thought:
//             'Love takes off masks that we fear we cannot live without and know we cannot live within.',
//         blurhash: 'LME3kxNLDiaK01kD%hozxvg3WUM_'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/photo-1500322969630-a26ab6eb64cc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//         thought:
//             'Love takes off masks that we fear we cannot live without and know we cannot live within.',
//         blurhash: 'L{Ez8JR.WCaxyGaeWVa\$RjWCoJjt'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/photo-1472213984618-c79aaec7fef0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//         thought:
//             'The most important thing in life is to learn how to give out love, and to let it come in.',
//         blurhash: 'LEC6WZxURNs;^-WZogaxIVNIxvR*'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/photo-1491466424936-e304919aada7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//         thought:
//             'Love will find a way through paths where wolves fear to prey.',
//         blurhash: 'L41;VNlAXop0aYaenMoyUue8VCV]'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/photo-1482164565953-04b62dcac1cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
//         thought: '... it’s a blessed thing to love and feel loved in return.',
//         blurhash: 'LB8g4=R-0#WB=_WWNHWCE2ay={kC'),
//     ImagesModel(
//         author: '',
//         source:
//             'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MTY0Nn0',
//         thought:
//             "Love is like a good cake; you never know when it's coming, but you'd better eat it when it does!",
//         blurhash: 'LjIPI#%LbJM{?ds;kCWAM{WAWBoz'),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600340432559-f1f4d02a3292?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   thought: 'Tough times don’t last. Tough people do.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1578452171578-a605cb38abe1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80',
//   thought:
//       'Keep going. Everything you need will come to you at the perfect time.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1555188220-90cc2cad3537?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   thought:
//       'You have to be at your strongest when you’re feeling at your weakest.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600673384259-252d51774f4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=650&q=80',
//   thought: 'Never give up. Great things take time. Be patient.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600370799735-7c03daccfb8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=653&q=80',
//   thought:
//       'It does not matter how slowly you go as long as you do not stop',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600358201177-642a15fd6142?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   thought:
//       'You have to be at your strongest when you’re feeling at your weakest.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600356604581-e573833d02e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   thought: 'Courage is one step ahead of fear.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1581278551025-29d98315ce48?ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80',
//   thought:
//       'If you feel like giving up, just look back on how far you are already',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600430450133-cd2c5dcc51e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   thought: 'Look in the mirror. That’s your competition.',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1600366776033-ac12647f5a72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=651&q=80',
//   thought: 'Everything you’ve ever wanted is on the other side of fear. ',
// ),
// ImagesModel(
//   author: '',
//   source:
//       'https://images.unsplash.com/photo-1598948953054-896179750dc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDAxNX0&auto=format&fit=crop&w=633&q=80',
//   thought: 'Pain is temporary. Quitting lasts forever.',
// ),
