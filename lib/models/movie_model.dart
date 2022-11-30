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
      {required this.id,
      required this.title,
      required this.overview,
      this.poster_path,
      required this.release_date});

// Factory is needed to handle the data reveiced from api service
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      poster_path:
          json['poster_path'] != null ? json['poster_path'] as String : null,
      release_date: json['release_date'] ?? "",
    );
  }

// Function to return poster
  String posterUrl() {
    Api API = Api();
    return API.BASE_URL_POSTER + poster_path!;
  }
}
