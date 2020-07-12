import 'package:dbmovie/local/my_locations.dart';
import 'package:dbmovie/net/api/resposity/movie_resposity.dart';
import 'package:dbmovie/net/model/resp/list_movie.dart';
import 'package:dbmovie/ui/item/movie_item.dart';
import 'package:dbmovie/ui/widget/widget_utils.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoviePageStete();
  }
}

class MoviePageStete extends State<MoviePage> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var language = MyLocation.of(context);
    List<Tab> _tabs = <Tab>[
      Tab(text: '${language.trans("movie_all")}'),
      Tab(text: '${language.trans("movie_action")}'),
      Tab(text: '${language.trans("movie_love")}'),
      Tab(text: '${language.trans("movie_less")}'),
      Tab(text: '${language.trans("movie_disaster")}'),
    ];
    _controller =
        TabController(initialIndex: 0, length: _tabs.length, vsync: this);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Movie"),
        bottom: TabBar(
          controller: _controller,
          tabs: _tabs,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabs.map((Tab tab) => MovieList(tab.text)).toList(),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  String type;

  MovieList(this.type);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  ScrollController _scrollController = ScrollController();
  int _startPage = 1;
  int _pageCount = 25;
  List<Movie> movies = List();
  var _isEmpty = false;
  var _isEmptyMsg = "";

  Future<void> myRefresh() async {
    await loadMovies(
        widget.type == "全部" ? "" : widget.type, _startPage, _pageCount)
        .then((value) {
      movies.clear();
      setState(() {
        movies.addAll(ListMovie
            .fromJson(value)
            .data);
        _isEmpty = movies.isEmpty;
        _isEmptyMsg = "暂无数据";
      });
    }).catchError((e) {
      _isEmpty = true;
      _isEmptyMsg = "${e.toString()}";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RefreshIndicator(child: _MovieList(movies), onRefresh: myRefresh),
        getEmptyWidget(_isEmpty),
      ],
    );
  }

  _MovieList(List<Movie> movies) {
    return ListView.builder(
      // 当不满一屏幕时 设置此属性即可展开下拉刷新
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemCount: movies.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return MovieItem(movies[index]);
      },
    );
  }
}
