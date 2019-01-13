import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/detail.dart';
import 'package:flutter_movie_app/podo/results_podo.dart';
import 'package:flutter_movie_app/podo/upcoming_podo.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

const url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=3ee47da55c8dae070eb764306712efc3&language=en-US&page=1';

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  bool loading = false;
  UpcomingP _upcoming;

  @override
  void initState() {
    super.initState();

    _fetchUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return _loadingView;
    }

    return Scaffold(
      body: GridView.builder(
        itemBuilder: (context, position) {
          final Results results = _upcoming.results[position];
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
        itemCount: _upcoming.results.length,
      ),
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  void _fetchUpcomingMovie() async {
    var response = await http.get(url);

    Map<String, dynamic> parsed = jsonDecode(response.body);
    setState(() {
      _upcoming = UpcomingP.fromJson(parsed);
      loading = true;
    });
  }

  void _handleTapDown(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(results: results,)),
    );
  }
}
