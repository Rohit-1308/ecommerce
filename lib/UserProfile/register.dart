import 'package:flutter/material.dart';
import 'inputFields.dart';

class Register extends StatefulWidget {
  static const routeName = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _getHeader(),
              SizedBox(
                height: 16,
              ),
              getRegiterText(),
              SizedBox(
                height: 10,
              ),
              _userInput("Enter full Name", Icons.account_circle),
              SizedBox(
                height: 10,
              ),
              _userInput("Email Address", Icons.email),
              SizedBox(
                height: 10,
              ),
              _userInput("Enter Password", Icons.lock),
              SizedBox(
                height: 10,
              ),
              _termsBox(),
              SizedBox(
                height: 10,
              ),
              _regiterButton(),
              Spacer(),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              _loginSection(),
            ],
          ),
        ));
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"))
              // color: Colors.orange[100],
            ),
          ),
        ),
      ],
    );
  }

  Widget getRegiterText() {
    return Container(
      child: Text(
        "Fill All Details*",
        style: TextStyle(fontSize: 10, color: Colors.red),
      ),
    );
  }

  //for user input
  Widget _userInput(String hText, IconData icon) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: TextField(
          decoration: InputDecoration(hintText: hText, icon: Icon(icon)),
        ),
      ),
    );
  }

  Widget _regiterButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Register With Us"),
        ),
      ),
    );
  }

//terms condition box
//
  Widget _termsBox() {
    return Container(
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (values) {}),
          Flexible(
              child: Text(
                  "You are Agree to our Term and Conditions & Pricvacy Policies.")),
        ],
      ),
    );
  }

  //register section
  Widget _loginSection() {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Text("Already Member? Login."),
        ),
      ),
    );
  }
}