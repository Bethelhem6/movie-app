// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';

class TopRatedMovies extends StatefulWidget {
  final List toprated;
  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  State<TopRatedMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TopRatedMovies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "TOP-RATED MOVIES⭐⭐⭐",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.toprated.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  // color: Colors.grey,
                  width: 280,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                name: widget.toprated[index]['title'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    widget.toprated[index]["backdrop_path"],
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    widget.toprated[index]["poster_path"],
                                description: widget.toprated[index]['overview'],
                                vote: widget.toprated[index]['vote_average']
                                    .toString(),
                                launch_on: widget.toprated[index]
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
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      widget.toprated[index]["poster_path"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.toprated[index]['title'] ?? 'Loading...',
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
