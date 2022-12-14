// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:ecommerce/Controller/CartController.dart';
import 'package:ecommerce/Controller/ItemController.dart';
import 'package:ecommerce/Screens/ItemPage.dart';
import 'package:ecommerce/API/RemoteService.dart';
import 'package:ecommerce/datamodel/info_product.dart';
import 'package:ecommerce/utils/apiUtils.dart';
import 'package:ecommerce/utils/appUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Static/tempCart.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<InfoProduct>? products;
  final ItemController itemController = Get.put(ItemController());
  final CartController cartController=Get.put(CartController());

  get itemBuilder => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProductInfoList();
    itemController.getProductInfoList();
  }

  // getProductInfoList() async {
  //   products = await RemoteService.getProductDetails();
  //   if (products != null) {
  //     print(products![0].size);
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // return (products == null)
    return Obx(() {
      print("count  ${itemController.productCount}");
      // if (itemController.productCount > 0) {
      //   itemController.update();
      // }
      return (itemController.productCount == 0)
          ? Text("No product found")
          : GridView.count(
              childAspectRatio: 0.55,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                for (int i = 0; i < itemController.productCount; i++)
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 8, top: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      // height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ApiUtils.getDiscount(
                                  itemController.products[i], context),
                              // Text("-10 % off"),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 3),
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemPage(),
                                    settings: RouteSettings(
                                        arguments: itemController.products[i])),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: ApiUtils.getImageUrl(
                                  itemController.products[i], context),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 8),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${itemController.products[i].productTitle}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4C53A5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description of product in words",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF4C53A5)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppUtils.getPrice(
                                      itemController.products[i].mrp),
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                      // fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 109, 111, 128)),
                                ),
                                Text(
                                  AppUtils.getPrice(
                                      itemController.products[i].price),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("pressed on inkwell");
                                    cartController.addToCart(itemController.products[i]);
                                    
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.shopping_cart_checkout,
                                      color: Color(0xFF4C53A5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            );
    });
  }
}
