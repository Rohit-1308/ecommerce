// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Controller/CartController.dart';

class CartNavigation extends StatefulWidget {
  const CartNavigation({Key? key}) : super(key: key);

  @override
  State<CartNavigation> createState() => _CartNavigationState();
}

class _CartNavigationState extends State<CartNavigation> {
  var _razorpay = Razorpay();
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    int amount = (cartController.getTotalAmountAsPaise());
    initiatePayment(amount);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "----------------------------------------suceess----------------------------------------------------");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(
        "----------------------------------------payment failed----------------------------------------------------");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(
        "----------------------------------------external wallet used----------------------------------------------------");
    // Do something when an external wallet was selected
  }

  void initiatePayment(amount) {
    var options = {
      'key': 'rzp_test_pi2fEEfhC66GKs',
      'currency': 'INR',
      'amount': amount,
      'name': 'rohit k',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '1234567891', 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (() {
          var options = {
            'key': 'rzp_test_pi2fEEfhC66GKs',
            'currency': 'INR',
            'amount': 10000,
            'name': 'rohit k',
            'description': 'Fine T-Shirt',
            'prefill': {'contact': '1234567891', 'email': 'test@razorpay.com'}
          };
          _razorpay.open(options);
        }),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
    

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
