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
    if (IdToProductCount.isEmpty) {
      IdToProductCount[id] = 1;
      CartProducts.add(product);
    }
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
    return orderTotalPrice * 0.18;
  }

  getOrderDiscount() {
    //gives discount amount based on generalDiscountPercent
    if (CartItemCount != 0) {
      double p = 0;
      for (int i = 0; i < CartItemCount; i++) {
        int count = IdToProductCount[CartProducts[i].id];
        double discountPercent =
            double.parse(CartProducts[i].generalDiscountPercent!);
        p += (discountPercent / 100) *
            double.parse(CartProducts[i].mrp!) *
            count;
      }
      orderTotalDiscount = p;
    }
    return orderTotalDiscount;
  }

  getOrderDiscountOnMrp() {
    if (CartItemCount != 0) {
      double p = 0;
      for (int i = 0; i < CartItemCount; i++) {
        int count = IdToProductCount[CartProducts[i].id];
        p += double.parse(CartProducts[i].mrp!) -
            double.parse(CartProducts[i].price!);
        p = p * count;
      }
      orderTotalDiscount = p;
    }
    return orderTotalDiscount;
  }

  getTotalAmount() {
    return (getOrderTotalPrice() * 1.18 + 70).toStringAsFixed(2);
  }
}
