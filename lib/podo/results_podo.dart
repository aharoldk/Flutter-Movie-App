class Results {
  double vote_average;
  String backdrop_path;
  bool adult;
  int id;
  String title;
  String overview;
  String original_language;
  String original_title;
  int vote_count;
  String poster_path;
  bool video;
  double popularity;
  List<int> genre_ids;
  String release_date;

  Results({
      this.vote_average,
      this.backdrop_path,
      this.adult,
      this.id,
      this.title,
      this.overview,
      this.original_language,
      this.original_title,
      this.vote_count,
      this.poster_path,
      this.video,
      this.popularity,
      this.genre_ids,
      this.release_date});

  factory Results.fromJson(Map<String, dynamic> parsedJson) {
    List<int> genre_ids = parsedJson['genre_ids'].cast<int>();

    return Results(
      vote_average: parsedJson['vote_average'].toDouble(),
      backdrop_path: parsedJson['backdrop_path'],
      adult: parsedJson['adult'],
      id: parsedJson['id'],
      title: parsedJson['title'],
      overview: parsedJson['overview'],
      original_language: parsedJson['original_language'],
      original_title: parsedJson['original_title'],
      vote_count: parsedJson['vote_count'],
      poster_path: 'https://image.tmdb.org/t/p/w500'+parsedJson['poster_path'],
      video: parsedJson['video'],
      genre_ids: genre_ids,
      popularity: parsedJson['popularity'].toDouble(),
      release_date: parsedJson['release_date'],
    );
  }
}
