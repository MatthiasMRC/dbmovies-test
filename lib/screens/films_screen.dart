import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';
import 'package:test_technique_flutter/services/api_service.dart';
import 'package:test_technique_flutter/widgets/movie_card.dart';

class FilmsScreen extends StatefulWidget {
  List<MovieModel>? movies;
  FilmsScreen({Key? key, this.movies}) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.movies == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              final currentMovie = widget.movies![index];
              // Use a widget to display each movies
              return MovieCard(
                movieModel: currentMovie,
              );
            },
          );
  }
}
