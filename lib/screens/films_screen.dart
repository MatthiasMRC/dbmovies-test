// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';
import 'package:test_technique_flutter/widgets/movie_card.dart';

class FilmsScreen extends StatefulWidget {
  // Injection of the MovieProvider
  MovieProvider? movieProvider;
  FilmsScreen({Key? key, this.movieProvider}) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  @override
  Widget build(BuildContext context) {
    // This widget is the first screen called (index 0)
    // This ternary condition check if movie list is null or not and display the right widget according to the application construction
    return widget.movieProvider!.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              final movieProvider = widget.movieProvider!;
              // Use a widget to display each movies
              return MovieCard(
                movieModel: movieProvider.movies[index]!,
              );
            },
          );
  }
}
