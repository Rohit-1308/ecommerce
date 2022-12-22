import 'package:flutter/material.dart';
import 'card.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videogram",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(children: [
          PostCard(),
          SizedBox(
            height: 6,
          ),
          PostCard(),
          SizedBox(
            height: 6,
          ),
          PostCard(),
        ]),
      ),
    );
  }
}
