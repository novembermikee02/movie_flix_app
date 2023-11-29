class Movie {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  static const String imgBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      // posterPath: json['poster_path'] ?? '',
      posterPath: json['poster_path'] != null
          ? imgBaseUrl + json['poster_path']
          : '', // Appending base URL to poster path
      releaseDate: json['release_date'] ?? '',
    );
  }
}
