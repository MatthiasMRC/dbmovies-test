import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';
import 'package:test_technique_flutter/widgets/movie_card.dart';

class FavorisScreen extends StatefulWidget {
  const FavorisScreen({Key? key}) : super(key: key);

  @override
  State<FavorisScreen> createState() => _FavorisScreenState();
}

class _FavorisScreenState extends State<FavorisScreen> {
  @override
  Widget build(BuildContext context) {
    //Initialization of the watcher from provider package
    var favouriteMovies = context.watch<MovieProvider>().favouriteMovies;

    return ListView.builder(
      itemCount: favouriteMovies.length,
      itemBuilder: (BuildContext context, int index) {
        final currentMovie = favouriteMovies[index];
        // Use my own widget "MovieCard" to display each movies
        return MovieCard(
          movieModel: currentMovie,
        );
      },
    );
  }
}
