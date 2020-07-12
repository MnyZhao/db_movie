import 'package:dbmovie/local/my_locations.dart';

import 'package:dbmovie/ui/page_movie.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  MyLocation _language;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _language = MyLocation.of(context);
    // TODO: implement build
    List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
          icon: Icon(Icons.movie), title: Text("${_language.trans("movie")}")),
      BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          title: Text("${_language.trans("collection")}")),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("${_language.trans("my")}")),
    ];
    List<Widget> _pager = [
      MoviePage(),
      MoviePage(),
      Login(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _items,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
      ),
      body: _pager[_currentIndex],
    );
  }
}
