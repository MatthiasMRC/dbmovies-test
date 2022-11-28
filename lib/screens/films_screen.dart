import 'package:flutter/material.dart';
import 'package:test_technique_flutter/widgets/movie_card.dart';

class FilmsScreen extends StatefulWidget {
  FilmsScreen({Key? key}) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return MovieCard();
      },
    );
  }
}
