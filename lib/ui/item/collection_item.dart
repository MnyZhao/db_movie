import 'package:dbmovie/net/model/resp/collection.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class CollectionItem extends StatelessWidget {
  Collection collection;

  CollectionItem({this.collection});

  @override
  Widget build(BuildContext context) {
    collection = Collection();
    collection.moviePic =
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg";
    collection.movieId = "1292052";
    return Material(
//      borderRadius: BorderRadius.circular(6.0),
      color: Colors.grey[200],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getHeroPic(collection),
          Spacer(),
          Center(
            child: showText("肖申克的救赎"),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

Widget _getHeroPic(Collection c) {
  return Hero(tag: c.movieId, child: _getImage(c.moviePic));
}

Widget _getImage(String url) {
  return Container(
    child: FadeInImage.assetNetwork(
      placeholder: 'assets/place_holder.jpg',
      image: url,
      fit: BoxFit.cover,
    ),
  );
}

main() => runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: Colors.redAccent,
            accentColor: Colors.redAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
        home: Scaffold(
          appBar: getAppBar("text"),
//          body: CollectionItem(),
          body: GridView.builder(
            padding: EdgeInsets.all(5.0),
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 设置列数 每列间距 item宽高比例 垂直方向间距
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.75,
                crossAxisSpacing: 5.0),
            itemBuilder: (context, index) {
              return Expanded(
                child: CollectionItem(),
              );
            },
          ),
        ),
      ),
    );
