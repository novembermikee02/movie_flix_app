import 'package:flutter/material.dart';
import 'package:movie_flix_app/models/movie.dart';
import 'package:movie_flix_app/utils/http_utils.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Future<Movie> movieFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieFuture = HttpUtils.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: movieFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                debugPrint(snapshot.data!.title != null
                    ? snapshot.data!.title!
                    : 'No Title Available');
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    snapshot.data!.title ?? 'No Title Available',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasError) {
                debugPrint(snapshot.data!.title != null
                    ? snapshot.data!.title!
                    : 'No Title Available');
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
