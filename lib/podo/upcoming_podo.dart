import 'package:flutter_movie_app/podo/dates_podo.dart';
import 'package:flutter_movie_app/podo/results_podo.dart';

class UpcomingP {
  int page;
  int total_pages;
  int total_results;
  DatesP dates;
  List<Results> results;

  UpcomingP({
    this.page,
    this.total_pages,
    this.total_results,
    this.dates,
    this.results
  });

  factory UpcomingP.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Results> results = list.map((i) => Results.fromJson(i)).toList();

    return UpcomingP(
      page: parsedJson['page'],
      total_pages: parsedJson['total_pages'],
      total_results: parsedJson['total_results'],
      dates: DatesP.fromJson(parsedJson['dates']),
      results: results,
    );
  }
}