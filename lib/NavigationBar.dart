// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:ecommerce/Categories/explore_page.dart';
import 'package:ecommerce/Product/AddNewProduct.dart';
import 'package:ecommerce/Screens/Cart.dart';
import 'package:ecommerce/Screens/More.dart';
import 'package:ecommerce/Screens/Recommended.dart';
import 'package:ecommerce/Screens/home.dart';
import 'package:ecommerce/Screens/orderScreen.dart';
import 'package:ecommerce/TrackOrder/ordertrack.dart';
import 'package:ecommerce/UserProfile/profile.dart';
import 'package:flutter/material.dart';

import 'Static/tempCart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentindex = 0;
  final List _children = [
    HomePage(),
    ExplorePage(),
    CartPage(),
    OrderPage(),
    MyHomePage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget iconbox;
    return Scaffold(
        // backgroundColor: Colors.grey[100],
        drawer: const NavigationDrawer(),
        body: _children[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTappedBar,
            currentIndex: _currentindex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color(0xFF4C53A5),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
                backgroundColor: Color(0xFF4C53A5),
              ),
              BottomNavigationBarItem(
  
                icon: Badge(
                  alignment: Alignment.topRight,
                  badgeColor: Colors.red,
                  // padding: const EdgeInsets.all(7),
                  badgeContent:  Text(
                    "${CartItemData.cartItem.length}",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
                label: 'Cart',
                backgroundColor: Color(0xFF4C53A5),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fire_truck),
                label: 'Track',
                backgroundColor: Color(0xFF4C53A5),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
                label: 'More',
                backgroundColor: Color(0xFF4C53A5),
              ),
            ]));
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Color(0xFF4C53A5),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 12,
            ),
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('images/cart.png'),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'User Name',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              'UserName@gmail.com',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 3,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('DashBoard'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Orders Archive'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderArchive(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Sell Items'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewProduct(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('LogOut'),
            onTap: () {},
          ),
        ],
      );
}
