import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String bannerUrl, posterUrl, vote, name, description, launch_on;
  const Description({
    Key? key,
    required this.bannerUrl,
    required this.description,
    required this.launch_on,
    required this.name,
    required this.posterUrl,
    required this.vote,
  }) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Container(
                    child: Image.network(
                      widget.bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '⭐ Average rating -' + widget.vote,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  bottom: 10,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.name != null ? widget.name : 'Loading...',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Released on: " + widget.launch_on,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                width: 100,
                child: Image.network(widget.posterUrl),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.orange[50],
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
