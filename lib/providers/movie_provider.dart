import 'package:flutter/material.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/services/api_service.dart';

//Creation of the class Movie Provider with Change Notifier
class MovieProvider with ChangeNotifier {
//Declaration of movies list
  late List<MovieModel?> movies;

  //Declaration of boolean to display loader
  bool isLoading = false;

  //Function to get the data through provider package
  getPostData() async {
    isLoading = true;
    movies = (await ApiService().getPopularMovies());
    isLoading = false;

    notifyListeners();
  }

  //Initialization of movie list
  final List<MovieModel> _favouriteMovies = [];

  // Getter movies list
  List<MovieModel> get favouriteMovies => _favouriteMovies;

  // Function to handle add to list item
  void addToList(MovieModel movie) {
    _favouriteMovies.add(movie);
    notifyListeners();
  }

// Function to handle remove to list item
  void removeToList(MovieModel movie) {
    _favouriteMovies.remove(movie);
    notifyListeners();
  }
}
