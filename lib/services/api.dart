import 'package:test_technique_flutter/services/api_key.dart';

// Api class which contain all of base url
class Api {
// key provided from TMDB
  final String API_KEY = ApiKey.API_KEY;

// Base url to call request
  final String BASE_URL = "https://api.themoviedb.org/3/";

//Base url to display poster
  final String BASE_URL_POSTER = "https://image.tmdb.org/t/p/w500/";
}
