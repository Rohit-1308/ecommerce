import 'package:ecommerce/datamodel/info_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 class ApiUtils{

  static Widget getImageUrl(InfoProduct product,context) {
    if (product.variantImage != null) {
      return Image.network(product.variantImage!,
          height: MediaQuery.of(context).size.height * 0.15, width: 120);
    } else if (product.mainImage != null) {
      return Image.network(product.mainImage!,
          height: MediaQuery.of(context).size.height * 0.2, width: 120);
    } else {
      return Text("NO IMAGE FOUND");
    }
  }

  static Widget getDiscount(InfoProduct product,context) {
    if (product.generalDiscountPercent != null) {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xFF4C53A5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          " ${product.generalDiscountPercent} % off ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      );
    }else{
    return Container();

    }
  }
  }