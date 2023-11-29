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
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    print(arguments);
    var movieId = arguments['id'] as String;
    print(movieId);

    movieFuture = HttpUtils.getMovie(movieId);

    print(movieFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details - $movieId'),
      ),
      body: Center(
        child: FutureBuilder<Movie>(
          future: movieFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        snapshot.data!.title.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(
                      snapshot.data!.posterPath.toString(),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
