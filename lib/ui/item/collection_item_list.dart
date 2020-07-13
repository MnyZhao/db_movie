import 'package:flutter/material.dart';

import '../../net/model/resp/collection.dart';
import '../widget/widget_utils.dart';

main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: getAppBar("Test"),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return CollectionItemList();
            }),
      ),
    ));

class CollectionItemList extends StatelessWidget {
  Collection collection;

  CollectionItemList({this.collection});

  @override
  Widget build(BuildContext context) {
    collection = Collection();
    collection.moviePic =
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg";
    collection.movieId = "1292052";
    collection.movieTitle = "肖申克的救赎";
    collection.movieQuote = "直击灵魂巴拉。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。";
    collection.dateTime = "2012-09-09 12:55：44";
    return Container(
        margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(6.0),
          elevation: 2.0,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 95.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _getHeroPic(collection.moviePic),
                  _getTextColumn(collection),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _getHeroPic(String url) {
  return Hero(tag: "12", child: _getImageWidget(url));
}

/**
 * 裁剪坐上右下圆角
 */
Widget _getImageWidget(String url) {
  return Container(
    width: 65.0,
    height: 95.0,
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.0), bottomLeft: Radius.circular(6.0)),
      child: _getImageNetWork(url),
    ),
  );
}

/**
 * 获取图片
 */
Widget _getImageNetWork(String url) {
  try {
    if (url.isNotEmpty) {
      return new FadeInImage.assetNetwork(
        placeholder: 'assets/place_holder.jpg',
        image: url,
        fit: BoxFit.cover,
      );
    } else {
      return new Image.asset(
        'assets/place_holder.jpg',
        fit: BoxFit.cover,
      );
    }
  } catch (e) {
    return new Image.asset('assets/place_holder.jpg', fit: BoxFit.cover);
  }
}

Widget _getTextColumn(Collection c) {
  // 如果设置了 overflow 文字还是超出屏幕限制 在最外城包裹 Expanded
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showText(c.movieTitle, fontSize: 16, fontWeight: FontWeight.bold),
          Spacer(),
          showText(c.movieQuote),
          Spacer(),
          Container(
            alignment: Alignment.centerRight,
//            child: Text(c.dateTime),
            child: showText(c.dateTime),
          )
        ],
      ),
    ),
  );
}
