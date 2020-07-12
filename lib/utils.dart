import 'package:flutter/material.dart';

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

/// [width]获取横向间隔
/// [height] 获取纵向间隔线
Widget spacingBox({double height = 0.0, double width = 0.0}) {
  return SizedBox(width: width, height: height);
}

///
/// [text] 展示内容
/// [overflow] 溢出文本显示方式 默认显示省略号
/// [maxline] 允许展示行数 默认 1
/// [textColor] 文字颜色
/// [fontSize] 文字大小 默认14
/// [fontWeight] 文字样式 默认加粗
Widget showText(String text,
    {TextOverflow overflow = TextOverflow.ellipsis,
    int maxLine = 1,
    Color textColor,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal}) {
  return Expanded(
      flex: 0,
      child: Text(
        text,
        maxLines: maxLine,
        overflow: overflow,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ));
}

/// 获取Appbar
getAppBar(String titleMsg) {
  return AppBar(title: Text(titleMsg));
}
