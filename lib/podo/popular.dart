import 'package:flutter_movie_app/podo/base_grid_view.dart';
import 'package:flutter_movie_app/podo/results.dart';

class Popular implements BaseGridView {
  int page;
  int total_pages;
  int total_results;

  @override
  List<Results> results;

  Popular({
    this.page,
    this.total_pages,
    this.total_results,
    this.results
  });

  factory Popular.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Results> results = list.map((i) => Results.fromJson(i)).toList();

    return Popular(
      page: parsedJson['page'],
      total_pages: parsedJson['total_pages'],
      total_results: parsedJson['total_results'],
      results: results,
    );
  }
}
