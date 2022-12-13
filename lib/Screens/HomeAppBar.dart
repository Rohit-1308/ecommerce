
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            size: 30,
            color: Colors.deepPurple,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "DP SHOP",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          const Spacer(),
          Badge(
            badgeColor: Colors.red,
            padding: const EdgeInsets.all(7),
            badgeContent: const Text(
              "3",
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
              },
              child: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
