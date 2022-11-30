import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_flutter/models/movie_model.dart';
import 'package:test_technique_flutter/providers/movie_provider.dart';

// ignore: must_be_immutable
class MovieCard extends StatefulWidget {
  // This widget need receive data from Model
  // MovieModel is noted "required" in the constructor below to avoid null value
  MovieModel movieModel;
  MovieCard({Key? key, required this.movieModel}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  //Init state call initializeDateFormatting() for each items build in the parent listview.
  //It allows to init some functions at the begenning of the construction
  @override
  void initState() {
    super.initState();
    //Importation of intl/date_symbol_data_local.dart' package to handle string date manipulation
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    // Initialization of view width depending the mobile screen
    double width = MediaQuery.of(context).size.width;
    //Watcher initialization from provider package and listen event
    List<MovieModel> favouriteMovies =
        context.watch<MovieProvider>().favouriteMovies;

    return Container(
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
              child:
                  //this ternary condition check if poster_path is equal to null of contain a string
                  widget.movieModel.poster_path == null
                      ? const Center(
                          child: Icon(Icons.image_not_supported),
                        )
                      : SizedBox(
                          width: 90.0,
                          child: Image.network(
                            widget.movieModel.posterUrl(),
                            fit: BoxFit.cover,
                          ),
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
                              icon:
                                  //this ternary condition check if favouriteMovies list contains the movie index
                                  favouriteMovies.contains(widget.movieModel)
                                      ? const Icon(Icons.favorite,
                                          color: Colors.redAccent)
                                      : const Icon(Icons.favorite_border,
                                          color: Colors.redAccent),
                              onPressed: () {
                                //this condition check if favouriteMovies list contains the movie index and select the right function to call
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
                            //First it use DateFormat from intl package and parse the string return by API SERVICE into a DateTime format
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
                            // this ternary condition check if overview is empty or not
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
