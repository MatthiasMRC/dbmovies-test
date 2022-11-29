import 'package:flutter/material.dart';
import 'package:test_technique_flutter/models/movie_model.dart';

//Creation of the class Movie Provider with Change Notifier
class MovieProvider with ChangeNotifier {
  //Initialization of movie list
  final List<MovieModel> _favouriteMovies = [];

  // Getter movies list
  List<MovieModel> get favouriteMovies => _favouriteMovies;

  void addToList(MovieModel movie) {
    _favouriteMovies.add(movie);
    notifyListeners();
  }

  void removeToList(MovieModel movie) {
    _favouriteMovies.remove(movie);
    notifyListeners();
  }
}
