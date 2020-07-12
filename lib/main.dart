import 'package:dbmovie/local/my_locations.dart';
import 'package:dbmovie/ui/home.dart';
import 'package:dbmovie/ui/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'local/locations_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyLocationDelegate _myLocationDelegate = const MyLocationDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          accentColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)))),
      home: Home(),
//      home: Login(),
      //多语言配置 要支持的语言
      supportedLocales: MyLocationDelegate.supportedLocales(),
      // 配置代理类
      localizationsDelegates: [
        _myLocationDelegate, // 配置本地代理我们自己的翻译 比如要显示的文本等
        DefaultCupertinoLocalizations.delegate, //Cupertino widgets.的英语翻译
        GlobalMaterialLocalizations.delegate, //Material widgets.的英语翻译
        GlobalWidgetsLocalizations.delegate, // 本地化Widget 的翻译
      ],
      //通过localeResolutionCallback或localeListResolutionCallback回调来监听locale改变的事件
      localeResolutionCallback: _myLocationDelegate.resolution,
    );
  }
}
