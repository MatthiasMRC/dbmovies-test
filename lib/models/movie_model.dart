// ignore_for_file: non_constant_identifier_names

import 'package:test_technique_flutter/services/api.dart';

// Class model of Movie

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String? poster_path;
  final String release_date;

// Constructor of the model
  MovieModel(
    this.id,
    this.title,
    this.overview,
    this.poster_path,
    this.release_date,
  );

// Factory is needed to handle the data reveiced from api service
  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      map['id'] as int,
      map['title'] as String,
      map['overview'] as String,
      map['poster_path'] != null ? map['poster_path'] as String : null,
      map['release_date'] as String,
    );
  }

// Function to return poster
  String posterUrl() {
    Api API = Api();
    return API.BASE_URL_POSTER + poster_path!;
  }
}
