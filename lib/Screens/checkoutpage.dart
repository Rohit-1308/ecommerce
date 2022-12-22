import 'package:ecommerce/Screens/orderSummary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../Controller/CartController.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var _razorpay = Razorpay();
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState

    int amount = (cartController.getTotalAmountAsPaise());
    initiatePayment(amount);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "----------------------------------------suceess----------------------------------------------------");

    print("\n\n\n${response.paymentId}\n\n\n");

    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
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
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (() {
          //nothing till now;//todo
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
            "after payment i.e checkout page",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
