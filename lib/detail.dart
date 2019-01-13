import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/podo/results.dart';

class Detail extends StatelessWidget {
  final Results results;

  Detail({Key key, @required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _tag = "image" + results.id.toString();

    return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new NetworkImage(results.poster_path),
                  fit: BoxFit.cover)),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
        new Center(
          child: Hero(
            tag: _tag,
            child: Image.network(
              results.poster_path,
              width: 300.0,
            ),
          ),
        )
      ],
    );
  }
}
