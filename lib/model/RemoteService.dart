// import 'package:ecommerce/model/info_product/info_product.dart';
import 'dart:convert';

// import 'package:ecommerce/model/product_info.dart';
import 'package:http/http.dart' as http;

import 'info_product.dart';

class RemoteService {



  static Future<List<InfoProduct>?> getProductDetails() async {
    var client = http.Client();
     List<InfoProduct> products=[];
    var url = Uri.parse("https://ewiz.gq/android/get_products");
    var appId =
        "VkZkNFVtVkZOWEZaTTJST1pXc3hObFJyVW1wT1JsWnhWMWhvVDFaRk1UWlVibkJXVFRBNVJWVlVNRDA9";
    var appSecret =
        "\$2y\$10\$EqhOXJ3Br1Y6I2iRm6cPcuo9CWR8A9qBrNtI8xhpvbLjYA4Q2NyYW";
    var response = await client.post(url, body: {
      "get_items": "true",
      "item_type": "5",
      "APP_ID": appId,
      "APP_SECRET": appSecret
    });
    // print(response.body);
    print(response.statusCode);
    
    final productData=jsonDecode(response.body);
    // print(productData);
    
     products=List.from(productData).map((item) => InfoProduct.fromMap(item)).toList();
    if (response.statusCode == 200) {
      return products;
    }else{
      return null;
    }

  }
}
