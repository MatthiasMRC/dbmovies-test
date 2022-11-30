// Api class to call request
// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/services/api.dart';
import 'package:dio/dio.dart';

class ApiService {
  //Instance of Api class to access to the reference
  Api API = Api();

  //Instance of Dio package to call http request and process status code
  Dio DIO = Dio();

  //Function to get the data with http request
  Future<Response> getData(String path, int page) async {
    // url with dynamic "path" to select in the futur which type of movies we want to return eg: popular, etc...
    String _URL = API.BASE_URL + path;

    //Map with dynamic parameters
    Map<String, dynamic> _QUERY = {
      "api_key": API.API_KEY,
      "language": "fr-FR",
      "page": page
    };

    //Query with endpoint url (_URL & _QUERY)
    final response = await DIO.get(_URL, queryParameters: _QUERY);

    if (response.statusCode == 200) {
      return response;
    } else {
      // if the response if different to 200 status code and return 401 or 404 status code that throw the error
      throw response;
    }
  }

  //Function to get Popular Movies
  Future<List<MovieModel>> getPopularMovies() async {
    Response response = await getData("/movie/popular", 1);

    if (response.statusCode == 200) {
      //Get all the data from results list
      List<dynamic> results = response.data["results"];

      //Add results to a Movies Model list with a loop
      List<MovieModel> movies = [];
      for (Map<String, dynamic> map in results) {
        MovieModel movie = MovieModel.fromJson(map);
        movies.add(movie);
      }
      return movies;
    } else {
      // if the response if different to 200 status code and return 401 or 404 status code that throw the error
      throw response;
    }
  }
}
