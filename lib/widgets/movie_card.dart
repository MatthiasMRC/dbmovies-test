import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  MovieCard({Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            Container(
              width: 80.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: Colors.red,
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
                            const Text("Black Adam",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {},
                              constraints: const BoxConstraints(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("2022-10-19",
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
                      children: const [
                        Flexible(
                          child: Text(
                            "Près de 5000 ans après avoir été doté des pouvoirs tout puissants des dieux égyptiens – et emprisonné très rapidement après – Black Adam est libéré de sa tombe terrestre, prêt à faire régner sa forme unique de justice dans le monde moderne.",
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
