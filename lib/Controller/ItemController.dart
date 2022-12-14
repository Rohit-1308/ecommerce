import 'package:ecommerce/datamodel/info_product.dart';
import 'package:get/get.dart';

import '../API/RemoteService.dart';

class ItemController extends GetxController {
  // var products = <InfoProduct>[].obs;
  RxList<InfoProduct> products = (List<InfoProduct>.of([])).obs;
  get productCount => products.value.length;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getProductInfoList() async {
    products.value = await RemoteService.getProductDetails();
    update();
  }
}
