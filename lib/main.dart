import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/podo/popular_podo.dart';
import 'package:http/http.dart' as http;

const url = 'https://api.themoviedb.org/3/movie/popular?api_key=3ee47da55c8dae070eb764306712efc3&language=en-US&page=1';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Popular _popular;

  @override
  void initState() {
    super.initState();
    print('here');

    _fetchPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.yellow,
            ),
          ),
        ),
      ),
      body: GridView.builder(
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: _handleTapDown,
              child: Card(
                child: Image.network(
                    'https://image.tmdb.org/t/p/w500'+_popular.results[position].poster_path,
                    fit: BoxFit.cover
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
    print(response.body);
    Map<String, dynamic> parsed = jsonDecode(response.body);
    setState(() {
      _popular = Popular.fromJson(parsed);
    });
  }

  void _handleTapDown() {
    print('Uhuy');
  }
}
