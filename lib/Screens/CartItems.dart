// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Categories/padding.dart';
import 'package:ecommerce/Screens/Cart.dart';
import 'package:ecommerce/Static/UiData.dart';
import 'package:ecommerce/utils/appUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Controller/CartController.dart';

import 'package:get/get.dart';

import '../Controller/ItemController.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({Key? key}) : super(key: key);

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final ItemController itemController = Get.put(ItemController());

    var totalWidth = MediaQuery.of(context).size.width;
    var items = cartController.CartProducts;
    var itemCountMap = cartController.IdToProductCount;

    return Obx(() {
      return Column(
        children: [
          for (int i = 0; i < cartController.CartItemCount; i++)
            Container(
              height: UiData.getScreenHeight(context) * 0.12,
              width: totalWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: totalWidth * 0.01, vertical: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 15),
                    // child: Image.asset("images/1.png"),
                    child: Image.network(
                      items[i].variantImage!,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[i].productTitle!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Row(children: [
                          Text(
                            AppUtils.getPrice(items[i].price),
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                // fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 109, 111, 128)),
                          ),
                          Text(
                            AppUtils.getPrice(itemController
                                .getPriceWithDiscount(items[i])
                                .toString()),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // CartItemData.deleteCartItem(items[i].id!, i);
                      // setState(() {
                      //   CartItemData.updatePaymentSummary();
                      // });
                      cartController.deleteCartItem(items[i].id!, i);
                      // setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cartController
                                      .decrementCartItemCount(items[i].id!);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${itemCountMap[items[i].id]}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  cartController
                                      .incrementCartItemCount(items[i].id!);
                                  // setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }
}
