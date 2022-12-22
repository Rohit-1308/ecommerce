import "dart:core";

class AppUtils {
  static String getPrice(dynamic price) {
    double res = double.parse(price);
    if (res < 100000) {
      return " \u{20B9} ${res.toInt()}";
    } else {
      res = res / 100000;
      dynamic ans = res.toStringAsFixed(1);
      return "\u{20B9} $ans L";
    }
  }
}
