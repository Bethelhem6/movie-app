import 'package:flutter/material.dart';
import 'package:movie_app/widgets/popular_movies.dart';
import 'package:movie_app/widgets/toprated_movies.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Home());
  }
}

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
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingResults = await tmdbwithCustomLogo.v3.trending.getTrending();
    Map topRatedResults = await tmdbwithCustomLogo.v3.movies.getTopRated();
    Map tvResults = await tmdbwithCustomLogo.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tvShows = tvResults['results'];
      // print(tvShows);
      print(trendingMovies);
      // print(topRatedMovies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movie App"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Popular(popular: topRatedMovies),
          TopRatedMovies(toprated: trendingMovies),
          TrendingMovies(trending: tvShows),
        ],
      ),
    );
  }
}
