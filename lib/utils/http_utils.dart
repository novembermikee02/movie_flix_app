import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_flix_app/models/movie.dart';

class HttpUtils {
  static const String apiKey = '8d05b1fe746f8512c98d36558a3a24bd';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  // static const String baseUrl = 'https://api.themoviedb.org/3/movie/550';

  static const JsonDecoder decoder = JsonDecoder();
  static const JsonEncoder encoder = JsonEncoder.withIndent(' ');

  static Future<List<Movie>> getMovies(String nowPlaying) async {
    String movieUrl = '$baseUrl/$nowPlaying?api_key=$apiKey';
    var response = await http.get(Uri.parse(movieUrl));

    if (response.statusCode == 200) {
      return compute(parseMovies, response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<Movie> getMovie(String movieId) async {
    String movieUrl = '$baseUrl/$movieId?api_key=$apiKey';
    debugPrint(movieUrl);
    var response = await http.get(Uri.parse(movieUrl));

    if (response.statusCode == 200) {
      return Movie.fromJson(decoder.convert(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // static List<Movie> parseMovies(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  // }

  static List<Movie> parseMovies(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}
