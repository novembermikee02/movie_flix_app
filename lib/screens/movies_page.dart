import 'package:flutter/material.dart';
import 'package:movie_flix_app/models/movie.dart';
import 'package:movie_flix_app/utils/http_utils.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late Future<List<Movie>> moviesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesFuture = HttpUtils.getMovies('now_playing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Flix App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/movies',
                          arguments: {'id': "${snapshot.data![index].id}"},
                        );
                        print(snapshot.data![index].posterPath.toString());
                      },
                      // child: Text(snapshot.data![index].title.toString()),
                      child: Image.network(
                        snapshot.data![index].posterPath.toString(),
                      ),
                    );
                  },
                ),
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
