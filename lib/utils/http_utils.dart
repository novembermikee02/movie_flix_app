import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_flix_app/models/movie.dart';

class HttpUtils {
  static const String apiKey = '8d05b1fe746f8512c98d36558a3a24bd';
  // static const String baseUrl =
  //     'https://api.themoviedb.org/3/movie/now_playing';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/550';

  static const JsonDecoder decoder = JsonDecoder();
  static const JsonEncoder encoder = JsonEncoder.withIndent(' ');

  static Future<Movie> getMovie() async {
    String movieUrl = '$baseUrl?api_key=$apiKey';
    var response = await http.get(Uri.parse(movieUrl));

    if (response.statusCode == 200) {
      return Movie.fromJson(decoder.convert(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
