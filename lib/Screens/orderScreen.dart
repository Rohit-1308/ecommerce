import 'dart:ffi';

import 'package:flutter/material.dart';

class OrderArchive extends StatefulWidget {
  const OrderArchive({Key? key}) : super(key: key);

  @override
  State<OrderArchive> createState() => _OrderArchiveState();
}

class _OrderArchiveState extends State<OrderArchive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 422,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/3.png",
                          height: 180,
                          width: 120,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item Name"),
                              Text("Brand Name"),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        )),
                              ),
                              Text("Price: Rs.200"),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: ElevatedButton(
                                      child: Text('Share'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple,
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontStyle: FontStyle.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: ElevatedButton(
                                      child: Text('Order Again'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple,
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontStyle: FontStyle.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 422,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/3.png",
                          height: 180,
                          width: 120,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item Name"),
                              Text("Brand Name"),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        )),
                              ),
                              Text("Price: Rs.200"),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: ElevatedButton(
                                      child: Text('Share'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple,
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontStyle: FontStyle.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: ElevatedButton(
                                      child: Text('Order Again'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple,
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontStyle: FontStyle.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
