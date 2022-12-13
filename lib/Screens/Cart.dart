// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Screens/CartAppBar.dart';
import 'package:ecommerce/Screens/CartItems.dart';
import 'package:ecommerce/Screens/CartNavigation.dart';
import 'package:flutter/material.dart';

import '../Static/UiData.dart';
import '../Static/tempCart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Widget> dynamicList = [];
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    var items = CartItemData.cartItem;
    if (items.length == 0) {
      return ListView(
        children: [
          CartAppBar(),
          Container(
            width: UiData.getScreenWidth(context),
            height: UiData.getScreenHeight(context) * 0.2,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: UiData.getScreenWidth(context) * 0.01, vertical: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Your Cart is Empty",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      );
    } else {
      return ListView(
        children: [
          const CartAppBar(),
          Container(
            // height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const CartItemSamples(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        (_isVisible) ? _isVisible = false : _isVisible = true;
                      });
                    },
                    child: Row(
                      children: [
                        Visibility(
                          visible: !_isVisible,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _isVisible,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Add coupon code",
                            style: TextStyle(
                                color: Color(0xFF4C53A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            labelText: 'Enter Code',
                            hintText: 'Enter Your Coupon Code')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: UiData.getScreenWidth(context) * 0.02,
                      vertical: 5),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment Summary",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Order Total",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "\u{20B9} ${CartItemData.getOrderTotalPrice()}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Tax(18%)",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "\u{20B9} ${CartItemData.getOrderTotalPrice() * 0.18}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Delivery charges",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "\u{20B9} ${CartItemData.deliveryCharges}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Discount Offer",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "\u{20B9} ${CartItemData.getDiscountTotal()}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2.00,
                        color: Color(0xFF4C53A5),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Total amount",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5)),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "\u{20B9} ${CartItemData.getTotalAmount()}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //     child: Column(
          //   children: dynamicList,
          // )),

          Container(
            child: const CartNavigation(),
          ),
        ],
      );
    }
  }
}
