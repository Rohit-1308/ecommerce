import 'dart:convert';
import 'package:ecommerce/API/StaticData.dart';
import 'package:http/http.dart' as http;
import '../datamodel/info_product.dart';

class RemoteService {
  static Future<List<InfoProduct>> getProductDetails() async {
    var client = http.Client();
    List<InfoProduct> products = [];
    var url = Uri.parse("${StaticData.URL}/get_products");

    var response = await client.post(url, body: {
      "get_items": "true",
      "item_type": "5",
      "APP_ID": StaticData.appId,
      "APP_SECRET": StaticData.appSecret
    });

    print(response.statusCode);

    final productData = jsonDecode(response.body);

    products = List.from(productData)
        .map((item) => InfoProduct.fromMap(item))
        .toList();
    if (response.statusCode == 200) {
      return products;
    } else {
      return [];
    }
  }
}
