import 'package:ecommerce/NavigationBar.dart';
import 'package:ecommerce/Screens/Product%20From.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 80,
                  width: 80,
                  child: Image(image: AssetImage('images/cart.png'))),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Image(
              image: AssetImage('images/signin.png'),
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                // controller: email,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black38),
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Stack(children: [
                TextField(
                  //  controller: password,
                  decoration: InputDecoration(
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.black38),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
                Container(
                  height: 48,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPass(),));
                      },
                      child: Text(
                        'Forgot?',
                        style: TextStyle(
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: MaterialButton(
                color: Color(0xFF4C53A5),
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoard(),
                      ));
                  //  register();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Or Login With...',
              style: TextStyle(color: Colors.black38),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //  Expanded(child: //OnlineButton('images/go.jpg', (){})),Expanded(child:OnlineButton('images/in.jpg', (){})),Expanded(child:OnlineButton('images/tw.png', (){}))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text.rich(
              TextSpan(text: "Don't have an account yet?", children: [
                TextSpan(
                  text: " SignUp",
                  style: TextStyle(
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  // recognizer: registeronTap,
                )
              ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              '',
              style: TextStyle(color: Colors.red),
            )),
          ],
        ),
      ),
    );
  }
}
