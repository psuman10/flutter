import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late var _razorpay;
  var amountController = TextEditingController();

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(hintText: "Enter your Amount"),
            ),
          ),
          CupertinoButton(
              color: Colors.green,
              child: const Text("Pay Amount"),
              onPressed: () {
                ///Make payment
                var options = {
                  'key': "rzp_test_Vjhe1UdH6X1Rgd",
                  // amount will be multiple of 100
                  'amount': (int.parse(amountController.text) * 100)
                      .toString(), //So its pay 500
                  'name': 'Razorpay',
                  'description': 'Payment',
                  'timeout': 300, // in seconds
                  'prefill': {
                    'contact': '9803724913',
                    'email': 'psuman9840@gmail.com'
                  }
                };
                _razorpay.open(options);
              })
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
