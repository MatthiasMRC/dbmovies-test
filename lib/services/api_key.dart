// ignore_for_file: non_constant_identifier_names

class ApiKey {
  // API key provided from TMDB
  // Must not be visible in public. We can call a cloud function request to get this key for Flutter Mobile.
  // Otherwise for Flutter Web, we can put this reference to .env file.
  static String API_KEY = "c4994741ea02b80556eea68c9af270dd";
}
