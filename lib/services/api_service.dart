// Api class to call request
import 'package:test_technique_flutter/services/api.dart';
import 'package:dio/dio.dart';

class ApiService {
  //Instance of Api class to access to the reference
  Api API = Api();

  //Instance of Dio package to call http request
  Dio DIO = Dio();

  Future<Response> getHttp(String path, int page) async {
    // url with dynamic "path" to select in the futur which type of movies we want to return eg: popular, etc...
    String _URL = API.BASE_URL + path;

//Map with parameters that will always be called.
    Map<String, dynamic> _QUERY = {
      "api_key": API.API_KEY,
      "language": "fr-FR",
      "page": page
    };

    //call the http request
    final response = await DIO.get(_URL, queryParameters: _QUERY);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }
}
