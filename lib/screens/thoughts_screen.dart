import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/thoughts_data.dart';
import '../widgets/thoughts.dart';

class ThoughtsScreen extends StatefulWidget {
  static const routeName = '/thoughts';

  @override
  _ThoughtsScreenState createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  bool textfield = true;
  bool _isLoading = false;
  String _query = 'Scenery';

  TextEditingController _textcontroller = TextEditingController();

  Future<void> search(String query) async {
    setState(() {
      textfield = false;
      _isLoading = true;
    });
    Provider.of<ThoughtsData>(context, listen: false)
        .getImageDatas(query, '1')
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    }).catchError((error) {
      //TODO : Show dialog
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ThoughtModel> thoughtsData =
        Provider.of<ThoughtsData>(context).thoughtItems;

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: textfield
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Type the image category',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoTextField(
                          controller: _textcontroller,
                          placeholder: 'Category...',
                          placeholderStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.search,
                              size: 25,
                            ),
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () => _textcontroller.clear(),
                              child: Icon(Icons.clear),
                            ),
                          ),
                          suffixMode: OverlayVisibilityMode.editing,
                          cursorColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.black.withOpacity(.5),
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: Colors.black.withOpacity(.8)),
                          onSubmitted: (query) {
                            // search(query);
                            setState(() {
                              _query = query;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                margin: const EdgeInsets.all(5.0),
                                borderOnForeground: true,
                                elevation: 6.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        'assets/images/back.png',
                                        width: 120,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 15,
                                      child: Container(
                                        child: Text(
                                          'Scenery',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 160 / 3,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 55,
                                      left: 10,
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                margin: const EdgeInsets.all(5.0),
                                borderOnForeground: true,
                                elevation: 6.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        'assets/images/clouds.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 15,
                                      child: Container(
                                        child: Text(
                                          'Sky',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 55,
                                      left: 10,
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {
                              search(_query);
                            },
                            child: Text('Default'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            search(_query);
                          },
                          child: Text('Get quotes'),
                        )
                      ],
                    ),
                  )
                : _isLoading
                    ? CircularProgressIndicator()
                    : CarouselSlider.builder(
                        itemCount: thoughtsData.length,
                        itemBuilder: (context, index) {
                          return Thoughts(
                            source: thoughtsData[index].source,
                            blurhash: thoughtsData[index].blurhash,
                            author: thoughtsData[index].author,
                            thought: thoughtsData[index].thought,
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: .81,
                          height: 75.h,
                          enlargeCenterPage: true,
                          aspectRatio: 1.5,
                          enableInfiniteScroll: false,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
