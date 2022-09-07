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
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Popular 🧡 ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        Container(
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.popular.length,
              itemBuilder: (context, index) {
                return Container(
                  // color: Colors.grey,
                  width: 200,
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
                          margin: EdgeInsets.only(left: 10),
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        widget.popular[index]["poster_path"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          widget.popular[index]['title'] != null
                              ? widget.popular[index]['title']
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
