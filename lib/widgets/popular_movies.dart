// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';

class Popular extends StatefulWidget {
  final List popular;
  const Popular({Key? key, required this.popular}) : super(key: key);

  @override
  State<Popular> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Popular 🧡 ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.popular.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  // color: Colors.grey,
                  width: 150,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                name: widget.popular[index]['title'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    widget.popular[index]["backdrop_path"],
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    widget.popular[index]["poster_path"],
                                description: widget.popular[index]['overview'],
                                vote: widget.popular[index]['vote_average']
                                    .toString(),
                                launch_on: widget.popular[index]
                                    ['release_date'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 180,
                          decoration: BoxDecoration(
                             color: Colors.grey[800],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        widget.popular[index]["poster_path"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.popular[index]['title'] ?? 'Loading...',
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.orange,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
