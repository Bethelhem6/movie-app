import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // height: ,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Positioned(
              left: 40,
              top: 60,
              right: 20,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "My Movies ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            // const Positioned(
            //   left: 100,
            //   top: 240,
            //   right: 20,
            //   child: Padding(
            //     padding: EdgeInsets.all(15.0),
            //     child: Text(
            //       " Get all the information you need about the movies you want to watch!",
            //       style: TextStyle(
            //         color: Colors.orange,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 50,
            //       ),
            //     ),
            //   ),
            // ),
            const Positioned(
              left: 30,
              bottom: 100,
              right: 20,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                  backgroundColor: Colors.orange,
                  strokeWidth: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
