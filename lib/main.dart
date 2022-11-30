import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';
import 'package:test_technique_flutter/screens/favoris_screen.dart';
import 'package:test_technique_flutter/screens/films_screen.dart';
import 'package:test_technique_flutter/services/api_service.dart';

//Provider is use in this application for the state management
//To get more information about this package : https://pub.dev/packages/provider

void main() {
  //Provider include all the application at the first level of the tree
  //It call MovieProvider which is the only provider use in this application
  //You have to use MultiProvider if you need to use futher provider class
  runApp(ChangeNotifierProvider<MovieProvider>(
      child: const MyApp(), create: (_) => MovieProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //index selector
  int currentIndex = 0;
  //Declaration of movies list
  List<MovieModel>? movies;

  //Function called at init state to get popular movies handle by api service
  void getPopularMovies() {
    ApiService()
        .getPopularMovies()
        .then((results) => setState(() => movies = results));
  }

// Initialization of movies list
  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    // list of screens widget
    final screens = <Widget>[
      FilmsScreen(
        movies: movies,
      ),
      const FavorisScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies DB - API"),
      ),
      body:
          // the screen to display is dynamic - depending of the currentIndex
          screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Films"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Favoris"),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
