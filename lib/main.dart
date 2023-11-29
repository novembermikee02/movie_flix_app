import 'package:flutter/material.dart';
import 'package:movie_flix_app/screens/movie_details_page.dart';
import 'package:movie_flix_app/screens/movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesPage(),
      routes: {
        '/movies': (context) => const MovieDetailsPage(),
      },
    );
  }
}
