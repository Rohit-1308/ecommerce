import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1593642532400-2682810df593?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
