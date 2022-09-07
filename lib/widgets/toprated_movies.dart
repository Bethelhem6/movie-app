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
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "TOP-RATED MOVIES⭐⭐⭐",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 230,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.toprated.length,
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
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          widget.toprated[index]
                                              ["poster_path"]))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          widget.toprated[index]['title'] != null
                              ? widget.toprated[index]['title']
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
