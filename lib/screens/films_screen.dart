import 'package:flutter/material.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/services/api_service.dart';
import 'package:test_technique_flutter/widgets/movie_card.dart';

class FilmsScreen extends StatefulWidget {
  FilmsScreen({Key? key}) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  //Declaration of movies list
  List<MovieModel>? movies;

// Function called at init state to get popular movies handle by api service
  void getPopularMovies() {
    ApiService()
        .getPopularMovies()
        .then((results) => setState(() => movies = results));
  }

// Initialization of movies list
  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return movies == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              // Use a widget to display each movies
              return MovieCard(
                movieModel: movies![index],
              );
            },
          );
  }
}
