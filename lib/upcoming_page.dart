import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_loading.dart';
import 'package:flutter_movie_app/custom_grid_view.dart';
import 'package:flutter_movie_app/detail.dart';
import 'package:flutter_movie_app/podo/results.dart';
import 'package:flutter_movie_app/podo/upcoming.dart';
import 'package:http/http.dart' as http;

const url =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=3ee47da55c8dae070eb764306712efc3&language=en-US&page=1';

class UpcomingPage extends StatefulWidget {
  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  bool loading = false;
  Upcoming _upcoming;

  @override
  void initState() {
    super.initState();

    _fetchUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return CustomLoading();
    }

    return Scaffold(
        body: CustomGridView<Upcoming>(
      object: _upcoming,
      handleTapDown: this._handleTapDown,
    ));
  }

  void _fetchUpcomingMovie() async {
    var response = await http.get(url);

    Map<String, dynamic> parsed = jsonDecode(response.body);
    setState(() {
      _upcoming = Upcoming.fromJson(parsed);
      loading = true;
    });
  }

  void _handleTapDown(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Detail(
                results: results,
              )),
    );
  }
}
