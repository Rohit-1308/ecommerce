// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Screens/ItemPage.dart';
import 'package:ecommerce/API/RemoteService.dart';
import 'package:ecommerce/datamodel/info_product.dart';
import 'package:ecommerce/utils/apiUtils.dart';
import 'package:ecommerce/utils/appUtils.dart';
import 'package:flutter/material.dart';

import '../Static/tempCart.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<InfoProduct>? products;

  get itemBuilder => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductInfoList();
  }

  getProductInfoList() async {
    products = await RemoteService.getProductDetails();
    if (products != null) {
      print(products![0].size);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (products == null)
        ? Text("No product found")
        : GridView.count(
            childAspectRatio: 0.55,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < products!.length; i++)
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
                            ApiUtils.getDiscount(products![i], context),
                            Padding(
                              padding: const EdgeInsets.only(right: 8, top: 3),
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
                                  settings:
                                      RouteSettings(arguments: products![i])),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            // child: getImageUrl(i),
                            child: ApiUtils.getImageUrl(products![i], context),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${products![i].productTitle}",
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
                                AppUtils.getPrice(products![i].mrp),
                                style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    // fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 109, 111, 128)),
                              ),
                              Text(
                                AppUtils.getPrice(products![i].price),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5)),
                              ),
                              InkWell(
                                onTap: () {
                                  print("pressed on inkwell");
                                  if (products![i] != null) {
                                    CartItemData.addToCart(products![i]);
                                  }
                                  print(
                                      "total count is ${CartItemData.cartItemCount[products![i].id]}");
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
  }
}
