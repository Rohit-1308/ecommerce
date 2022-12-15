import 'dart:math';

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

  isDiscountAvailble(i) {
    if (products[i] != null) {
      if (products[i].generalDiscountPercent != null) {
        return true;
      } else {
        return false;
      }
    }
  }

  getProductInfoList() async {
    products.value = await RemoteService.getProductDetails();
    update();
  }

  getPriceWithDiscount(dynamic product) {
    if (product != null) {
      double gDisP = 00.0;
      double mItemDisP = 0.00;
      double mCatDisP = 0.0;
      double mSubCatDisP = 0.00;

      if (product.generalDiscountPercent != null) {
        gDisP = double.parse(product.generalDiscountPercent);
      }
      if (product.membershipItemDiscountPercent != null) {
        gDisP = double.parse(product.membershipItemDiscountPercent);
      }
      if (product.membershipCategoryDiscountPercent != null) {
        gDisP = double.parse(product.membershipCategoryDiscountPercent);
      }
      if (product.membershipSubCategoryDiscountPercent != null) {
        gDisP = double.parse(product.membershipSubCategoryDiscountPercent);
      }
      int count = 0;
      double finalDiscountPercent = 0.0, p;

      finalDiscountPercent =
          max(max(gDisP, mItemDisP), max(mCatDisP, mSubCatDisP));
      return ((100 - finalDiscountPercent) / 100) * double.parse(product.price);
    }
  }
}
