import 'package:flutter/material.dart';
import 'package:movie_flix_app/screens/movie_details_page.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MovieDetailsPage(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Fetch Movies Details',
            ),
          ),
        ),
      ),
    );
  }
}
