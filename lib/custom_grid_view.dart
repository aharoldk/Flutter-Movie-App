import 'package:flutter/material.dart';
import 'package:flutter_movie_app/podo/base_grid_view.dart';
import 'package:flutter_movie_app/podo/results.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomGridView<T extends BaseGridView> extends StatelessWidget {
  final T object;
  final void Function(Results) handleTapDown;

  CustomGridView({
    Key key,
    @required this.object,
    @required this.handleTapDown
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, position) {
        final Results results = object.results[position];
        final String _tag = "image" + results.id.toString();

        return GestureDetector(
          onTap: () => handleTapDown(results),
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
      itemCount: object.results.length,
    );
  }
}
