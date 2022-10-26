import 'package:flutter/material.dart';
import 'package:movie_app/widgets/popular_movies.dart';
import 'package:movie_app/widgets/toprated_movies.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final apiKeys = '5cde600abebaae0d8915a5fa3c047e1f';
  final accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1Y2RlNjAwYWJlYmFhZTBkODkxNWE1ZmEzYzA0N2UxZiIsInN1YiI6IjYzMGRiYjU0MjI2YzU2MDA3YmFkNTVkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cq_DEk3WQxhw7z34vtOmGlb8EPnDN8ArYkHFdCCDVrA';

  @override
  initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbwithCustomLogo = TMDB(ApiKeys(apiKeys, accessToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));

    Map pouparResult = await tmdbwithCustomLogo.v3.movies.getPopular();
    Map topRatedResults = await tmdbwithCustomLogo.v3.movies.getTopRated();
    Map tvResults = await tmdbwithCustomLogo.v3.tv.getPopular();

    setState(() {
      trendingMovies = pouparResult['results'];
      topRatedMovies = topRatedResults['results'];
      tvShows = tvResults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Movie App"),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          TopRatedMovies(toprated: trendingMovies),
          Popular(popular: topRatedMovies),
          TrendingMovies(trending: tvShows),
        ],
      ),
    );
  }
}
