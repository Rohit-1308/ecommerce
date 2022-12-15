import 'dart:math';

import 'package:ecommerce/datamodel/info_product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<InfoProduct> CartProducts = (List<InfoProduct>.of([])).obs;
  RxMap IdToProductCount = {}.obs;
  RxString couponCode = "".obs;
  // Rx<double> orderTotalPrice = (0.0).obs;
  double orderTotalPrice = 0;
  double orderTotalMrp = 0;
  double orderTotalTax = 0;
  double orderTotalDiscount = 0;

  get CartItemCount => IdToProductCount.length;

  addToCart(InfoProduct product) {
    String id = product.id!;
    if (IdToProductCount[id] != null) {
      if (IdToProductCount[id] > 0) {
        IdToProductCount[id]++;
      }
    } else {
      IdToProductCount[id] = 1;
      CartProducts.add(product);
    }
    print(CartItemCount);
  }

  deleteCartItem(String id, int i) {
    if (id != null) {
      CartProducts.remove(CartProducts[i]);
      IdToProductCount.remove(id);
      update();
    }
  }

  incrementCartItemCount(String id) {
    if (IdToProductCount != null) {
      IdToProductCount[id]++;
    }
  }

  decrementCartItemCount(String id) {
    if (IdToProductCount != null && IdToProductCount[id] > 1) {
      IdToProductCount[id]--;
    }
  }

  getOrderTotalPrice() {
    if (CartItemCount != 0) {
      double p = 0;
      for (int i = 0; i < CartItemCount; i++) {
        int count = IdToProductCount[CartProducts[i].id];
        p += double.parse(CartProducts[i].price!) * count;
      }
      orderTotalPrice = p;
    }
    return orderTotalPrice;
  }

  getOrderTax() {
    if (CartItemCount != 0) {
      double p = 0;
      for (int i = 0; i < CartItemCount; i++) {
        int count = IdToProductCount[CartProducts[i].id];
        p += double.parse(CartProducts[i].price!) * count;
      }
      orderTotalPrice = p;
    }
    return ((orderTotalPrice - getOrderDiscount()) * 0.18);
  }

  getOrderDiscount() {
    //gives discount amount based on generalDiscountPercent
    if (CartItemCount != 0) {
      double p = 0;
      double gDisP = 00.0;
      double mItemDisP = 0.00;
      double mCatDisP = 0.0;
      double mSubCatDisP = 0.00;

      int count = 0;
      double finalDiscountPercent = 0.0;

      for (int i = 0; i < CartItemCount; i++) {
        count = IdToProductCount[CartProducts[i].id];
        if (CartProducts[i].generalDiscountPercent != null) {
          gDisP = double.parse(CartProducts[i].generalDiscountPercent!);
        }
        if (CartProducts[i].membershipItemDiscountPercent != null) {
          gDisP = double.parse(CartProducts[i].membershipItemDiscountPercent);
        }
        if (CartProducts[i].membershipCategoryDiscountPercent != null) {
          gDisP =
              double.parse(CartProducts[i].membershipCategoryDiscountPercent);
        }
        if (CartProducts[i].membershipSubCategoryDiscountPercent != null) {
          gDisP = double.parse(
              CartProducts[i].membershipSubCategoryDiscountPercent);
        }
        finalDiscountPercent =
            max(max(gDisP, mItemDisP), max(mCatDisP, mSubCatDisP));

        p += (finalDiscountPercent / 100) *
            double.parse(CartProducts[i].price!) *
            count;
      }
      orderTotalDiscount = p;
    }
    return orderTotalDiscount;
  }

  getTotalAmount() {
    return (getOrderTotalPrice() + getOrderTax() + 70 - getOrderDiscount())
        .toStringAsFixed(2);
  }
}
