import 'package:dbmovie/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 列表页数据为空展示
Widget getEmptyWidget(bool isEmpty, {String data}) {
  return isEmpty
      ? Center(
          child: showText(data, fontSize: 18, fontWeight: FontWeight.bold),
        )
      : Container();
}

/// 获取纵横向间隔 Container
/// [width]获取横向间隔
/// [height] 获取纵向间隔线
/// [color] 间隔颜色
/// [padding] Container 四周内部填充距离
/// [margin]Container 四周外部填充距离
Widget spacingContainer(
    {double height = 0.0,
    double width = 0.0,
    Color color = Colors.transparent,
    double padding = 0.0,
    double margin = 0.0}) {
  return Container(
    color: color,
    height: height,
    width: width,
    margin: EdgeInsets.all(margin),
    padding: EdgeInsets.all(padding),
  );
}

///获取纵横向间隔 SizedBox
/// [width]获取横向间隔
/// [height] 获取纵向间隔线
Widget spacingBox({double height = 0.0, double width = 0.0}) {
  return SizedBox(width: width, height: height);
}

/// Text内容展示
/// [text] 展示内容
/// [overflow] 溢出文本显示方式 默认显示省略号
/// [maxline] 允许展示行数 默认 1
/// [textColor] 文字颜色
/// [fontSize] 文字大小 默认14
/// [fontWeight] 文字样式 默认加粗
Widget showText(String text,
    {TextOverflow overflow = TextOverflow.ellipsis,
    int maxLine,
    Color textColor,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal}) {
  return Expanded(
      child: Text(
    text,
    maxLines: maxLine,
    overflow: overflow,
    style:
        TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
  ));
}

/// 获取TextField
Widget inputWidget({bool isPwd}) {}
