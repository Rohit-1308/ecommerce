import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    List<String> _collections = [
      'Featured Products',
      'Best Selling',
      'Recently Added'
    ];
    String dropDownValue = '';
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4C53A5),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Material(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Products/Add',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF4C53A5),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              TabBar(
                  indicatorColor: Color(0xFF4C53A5),
                  labelColor: Color(0xFF4C53A5),
                  tabs: [
                    Tab(
                      text: 'GENERAL',
                    ),
                    Tab(
                      text: 'INVENTORY',
                    ),
                  ]),
              Expanded(
                child: Container(
                  child: TabBarView(children: [
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Product Name*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Product Description*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Card(
                                    child: Center(
                                        child: Text(
                                      'Product Image',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Price*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Companred Price*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Category*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Brand*',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text('Un-Pblished Products'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
