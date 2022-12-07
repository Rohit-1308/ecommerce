import 'package:ecommerce/model/RemoteService.dart';
import 'package:ecommerce/model/base_client.dart';
import 'package:ecommerce/model/info_product/info_product.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);
  

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<InfoProduct>? products;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getProductInfoList();
  }
  getProductInfoList()async{
    products=await RemoteService.getProductDetails();
    print("length of products is ${products!.length}");
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 8; i++)
          Container(
            padding: EdgeInsets.only(left: 8, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50 %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
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
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "images/$i.png",
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Tile",
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
                    style: TextStyle(fontSize: 15, color: Color(0xFF4C53A5)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. 200/-',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
      ],
    );
  }
}
