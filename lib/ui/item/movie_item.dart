import 'package:dbmovie/net/model/resp/list_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/widget_utils.dart';

class MovieItem extends StatelessWidget {
  Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return _getMovieItem();
  }

  Widget _getMovieItem() {
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
                  _getHeroPic(movie.mPic),
                  _getTextColumn(),
                ],
              ),
            ),
          ),
        ));
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

  Widget _getTextColumn() {
    // 如果设置了 overflow 文字还是超出屏幕限制 在最外城包裹 Expanded
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showText(movie.mTitleC, fontSize: 16, fontWeight: FontWeight.bold),
          showText(movie.mCast.trim(), textColor: Colors.black54, maxLine: 1),
          showText(movie.mQuote),
        ],
      ),
    ));
  }
}
