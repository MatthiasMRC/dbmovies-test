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
      child: const MyApp(), create: (context) => MovieProvider()));
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
      home:
          //We can also put the ChangeNotifierProvider here because it's the root of the application too
          const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Initialization of movies list
  @override
  void initState() {
    super.initState();
    //Declaration of instance of MovieProvider and launch getPostData method
    final movies = Provider.of<MovieProvider>(context, listen: false);
    movies.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    //Declaration of MovieModel provider to instance it
    final provider = Provider.of<MovieProvider>(context);

    // list of screens widget
    final screens = <Widget>[
      FilmsScreen(
        movieProvider: provider,
      ),
      const FavorisScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies DB - API"),
      ),
      body:
          // the screen to display is dynamic - depending of the currentIndex
          screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Films"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Favoris"),
        ],
        onTap: (index) => provider.setCurrentIndex(index),
      ),
    );
  }
}
