import 'dart:convert';

import 'package:test_technique_flutter/services/api.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// Model of Movie

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String? poster_path;
  final String release_date;

// Constructor
  MovieModel(
    this.id,
    this.title,
    this.overview,
    this.poster_path,
    this.release_date,
  );

  MovieModel copyWith({
    int? id,
    String? title,
    String? overview,
    String? poster_path,
    String? release_date,
  }) {
    return MovieModel(
      id ?? this.id,
      title ?? this.title,
      overview ?? this.overview,
      poster_path ?? this.poster_path,
      release_date ?? this.release_date,
    );
  }

// Function to resgiter to favourite
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': poster_path,
      'release_date': release_date,
    };
  }

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
