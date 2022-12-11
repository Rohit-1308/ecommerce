// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Screens/ItemPage.dart';
import 'package:ecommerce/model/RemoteService.dart';
import 'package:ecommerce/model/info_product.dart';
import 'package:flutter/material.dart';

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
    print("length of products is ${products!.length}");
    setState(() {});
  }

  getImageUrl(int i) {
    if (products![i].variantImage != null) {
      return Image.network(products![i].variantImage!,
          height: MediaQuery.of(context).size.height * 0.15, width: 120);
    } else if (products![i].mainImage != null) {
      return Image.network(products![i].mainImage!,
          height: MediaQuery.of(context).size.height * 0.2, width: 120);
    } else {
      return Text("NO IMAGE FOUND");
    }
  }

  getDiscount(int i) {
    if (products![i].generalDiscountPercent != null) {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xFF4C53A5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "- ${products![i].generalDiscountPercent}",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      );
    }
    return Container();
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
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                            getDiscount(i),
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
                                  settings: RouteSettings(arguments: products![i] )
                                  
                                ),
                                );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: getImageUrl(i),
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
                                'RS ${products![i].price}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Color(0xFF4C53A5),
                                  
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
