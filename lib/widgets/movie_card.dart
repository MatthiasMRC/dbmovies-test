import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';

class MovieCard extends StatefulWidget {
  MovieModel movieModel;
  MovieCard({Key? key, required this.movieModel}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    // Initialization of view width
    double width = MediaQuery.of(context).size.width;
    //Initialization of the watcher from provider package
    List<MovieModel> favouriteMovies =
        context.watch<MovieProvider>().favouriteMovies;

    return Container(
      key: ValueKey(widget.movieModel.id),
      height: 130.0,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: Image.network(
                widget.movieModel.posterUrl(),
                fit: BoxFit.cover,
                width: 90.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.movieModel.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: Icon(Icons.favorite,
                                  color: favouriteMovies
                                          .contains(widget.movieModel)
                                      ? Colors.redAccent
                                      : Colors.grey),
                              onPressed: () {
                                if (!favouriteMovies
                                    .contains(widget.movieModel)) {
                                  context
                                      .read<MovieProvider>()
                                      .addToList(widget.movieModel);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removeToList(widget.movieModel);
                                }
                              },
                              constraints: const BoxConstraints(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //String manipulation to display data to french date
                            Text(
                                DateFormat.yMMMM("fr").format(DateTime.parse(
                                    widget.movieModel.release_date)),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic)),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget.movieModel.overview.isEmpty
                                ? "..."
                                : widget.movieModel.overview,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
