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
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "TRENDING MOVIES",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.trending.length,
              itemBuilder: (context, index) {
                return Container(
                  // color: Colors.grey,
                  width: 140,
                  child: Column(
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          widget.trending[index]['title'] != null
                              ? widget.trending[index]['title']
                              : 'Loading...',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    ));
  }
}
