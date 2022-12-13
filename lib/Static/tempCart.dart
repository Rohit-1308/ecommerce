import 'package:ecommerce/datamodel/info_product.dart';

class CartItemData {
  static List<InfoProduct> cartItem = [];
  static Map<String, int> cartItemCount = {};

  static double deliveryCharges = 70.00;

  static addToCart(InfoProduct product) {
    if (cartItemCount.isEmpty) {
      cartItemCount[product.id!] = 1;
      cartItem.add(product);
    }
    if (cartItemCount[product.id] != null) {
      if (cartItemCount[product.id]! > 0) {
        var c = cartItemCount[product.id!];
        cartItemCount[product.id!] = (c! + 1);
      }
    } else {
      cartItemCount[product.id!] = 1;
      cartItem.add(product);
    }
  }

  static incrementItemCount(String id) {
    var c = cartItemCount[id];
    if (c != null) {
      cartItemCount[id] = (c + 1);
    }
  }

  static decrementItemCount(String id) {
    var c = cartItemCount[id];
    if (c != null && c > 1) {
      cartItemCount[id] = (c - 1);
    }
  }

  static deleteCartItem(String id, int i) {
    if (id != null) {
      bool status = cartItem.remove(cartItem[i]);
      cartItemCount.remove(id);
      print(status);
    }
  }

  static double getOrderTotalPrice() {
    double orderTotalPrice = 0.0;
    int? count;
    if (cartItem.length != 0) {
      for (int i = 0; i < cartItem.length; i++) {
        count = cartItemCount[cartItem[i].id]!;
        orderTotalPrice += double.parse(cartItem[i].price!) * count;
      }
    }

    return orderTotalPrice;
  }

  static double getOrderTotalMrp() {
    int? count;
    double orderTotalMrp = 0.0;
    if (cartItem.length != 0) {
      for (int i = 0; i < cartItem.length; i++) {
        count = cartItemCount[cartItem[i].id]!;
        var price = double.parse(cartItem[i].mrp!) * count;
        orderTotalMrp += price;
      }
    }

    return orderTotalMrp;
  }

  static dynamic getDiscountTotal() {
    double discountTotal = 0.0;
    int? count;
    if (cartItem.length != 0) {
      for (int i = 0; i < cartItem.length; i++) {
        if (cartItem[i].generalDiscountPercent != null) {
          count = cartItemCount[cartItem[i].id]!;
          var price = double.parse(cartItem[i].mrp!) * count;

          double discountPercent =
              double.parse(cartItem[i].generalDiscountPercent!);

          discountTotal += (discountPercent / 100) * price;
        }
      }
    }

    return discountTotal.toStringAsFixed(2);
  }

  static dynamic getTotalAmount() {
    double totalAmount = 0.0;
    totalAmount = getOrderTotalPrice() * 1.18 + deliveryCharges;
    return totalAmount.toStringAsFixed(2);
  }

  static updatePaymentSummary() {
    getOrderTotalPrice();
    getOrderTotalMrp();
    getDiscountTotal();
    getTotalAmount();
  }
}
