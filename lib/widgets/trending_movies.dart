// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';

class TrendingMovies extends StatefulWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        "TRENDING TV SHOWS",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
    SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.trending.length,
          itemBuilder: (context, index) {
            return SizedBox(
              // color: Colors.grey,
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: widget.trending[index]['original_name'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                widget.trending[index]["backdrop_path"],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                widget.trending[index]["poster_path"],
                            description: widget.trending[index]['overview'],
                            vote: widget.trending[index]['vote_average']
                                .toString(),
                            launch_on: widget.trending[index]
                                ['first_air_date'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      widget.trending[index]
                                          ["poster_path"]))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 5,
                  ),
                  Text(
                    widget.trending[index]['name'] ?? 'Loading...',
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
