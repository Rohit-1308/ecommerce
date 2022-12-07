import 'package:flutter/material.dart';

class JobPost extends StatefulWidget {
  const JobPost({Key? key}) : super(key: key);

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  late String _value1 = nameList1[0];

  final List<String> nameList1 = <String>[
    "Select Category",
    "Arrow Up",
    "Saddas",
  ];

  /// initialization is here:
  @override
  void initState() {
    super.initState();
    _value1 = nameList1[0];
  }

  @override
  Widget build(BuildContext context) {
    bool? checkedValue = false;
    bool? checkedValue1 = false;
    bool? checkedValue2 = false;
    bool? checkedValue3 = false;
    bool? checkedValue4 = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Post Product',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Product Title',
                    hintStyle: TextStyle(color: Colors.black38),
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Quantity Avaliable',
                    hintStyle: TextStyle(color: Colors.black38),
                    prefixIcon: Icon(Icons.card_travel_rounded),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: <Widget>[
                  Text(
                    ' Select Company',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: DropdownButton(
                      value: _value1,
                      onChanged: (value) {
                        setState(() {
                          _value1 = value!;
                        });
                      },
                      items: nameList1.map(
                        (item) {
                          return DropdownMenuItem(
                            value: item,
                            child: new Text(item),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Product Details',
                    hintStyle: TextStyle(color: Colors.black38),
                    prefixIcon: Icon(Icons.edit),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Offers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              children: [],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    title: Text("Discount"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title: Text("Offer Validity Date"),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue1 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title: const Text("Colours Avaliable"),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue3 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
