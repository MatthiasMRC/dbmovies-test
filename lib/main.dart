import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';
import 'package:test_technique_flutter/screens/favoris_screen.dart';
import 'package:test_technique_flutter/screens/films_screen.dart';

void main() {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // index selector
  int currentIndex = 0;

// list of screens
  final screens = <Widget>[FilmsScreen(), FavorisScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies DB - API"),
      ),
      body: screens[currentIndex],
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
