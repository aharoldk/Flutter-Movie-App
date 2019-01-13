import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_loading.dart';
import 'package:flutter_movie_app/detail.dart';
import 'package:flutter_movie_app/custom_grid_view.dart';
import 'package:flutter_movie_app/podo/popular.dart';
import 'package:flutter_movie_app/podo/results.dart';
import 'package:http/http.dart' as http;

const url =
    'https://api.themoviedb.org/3/movie/popular?api_key=3ee47da55c8dae070eb764306712efc3&language=en-US&page=1';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      return CustomLoading();
    }

    return Scaffold(
        body: CustomGridView<Popular>(
      object: _popular,
      handleTapDown: this._handleTapDown,
    ));
  }

  _fetchPopularMovie() async {
    var response = await http.get(url);

    Map<String, dynamic> parsed = jsonDecode(response.body);
    setState(() {
      _popular = Popular.fromJson(parsed);
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
