import 'package:flutter_movie_app/podo/base_grid_view.dart';
import 'package:flutter_movie_app/podo/dates.dart';
import 'package:flutter_movie_app/podo/results.dart';

class Upcoming implements BaseGridView {
  int page;
  int total_pages;
  int total_results;
  DatesP dates;

  @override
  List<Results> results;

  Upcoming({
    this.page,
    this.total_pages,
    this.total_results,
    this.dates,
    this.results
  });

  factory Upcoming.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Results> results = list.map((i) => Results.fromJson(i)).toList();

    return Upcoming(
      page: parsedJson['page'],
      total_pages: parsedJson['total_pages'],
      total_results: parsedJson['total_results'],
      dates: DatesP.fromJson(parsedJson['dates']),
      results: results,
    );
  }

}