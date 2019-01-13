import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/detail.dart';
import 'package:flutter_movie_app/podo/popular_podo.dart';
import 'package:flutter_movie_app/podo/results_podo.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

const url = 'https://api.themoviedb.org/3/movie/popular?api_key=3ee47da55c8dae070eb764306712efc3&language=en-US&page=1';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  Popular _popular;

  @override
  void initState() {
    super.initState();

    _fetchPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return _loadingView;
    }
    return Scaffold(
      body: GridView.builder(
        itemBuilder: (context, position) {
          final Results results = _popular.results[position];
          final String _tag = "image" + results.id.toString();

          return GestureDetector(
            onTap: () => _handleTapDown(results),
            child: Card(
              child: Hero(
                tag: _tag,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: results.poster_path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6),
        itemCount: _popular.results.length,
      ),
    );
  }

  _fetchPopularMovie() async {
    var response = await http.get(url);

    Map<String, dynamic> parsed = jsonDecode(response.body);
    setState(() {
      _popular = Popular.fromJson(parsed);
      loading = true;
    });
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  void _handleTapDown(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(results: results,)),
    );
  }
}
