// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartNavigation extends StatefulWidget {
  const CartNavigation({Key? key}) : super(key: key);

  @override
  State<CartNavigation> createState() => _CartNavigationState();
}

class _CartNavigationState extends State<CartNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Total:",
          //       style: TextStyle(
          //           color: Color(0xFF4C53A5),
          //           fontSize: 22,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     Text(
          //       "Rs. 600",
          //       style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.red),
          //     ),
          //   ],
          // ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF4C53A5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Check Out",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
