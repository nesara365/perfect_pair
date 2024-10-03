import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment({required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Your Merchant Name',
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
          ),
        );
        await displayPaymentSheet();
      }
    } catch (e) {
      print('Payment error: $e');
      Get.snackbar('Payment Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar(
        'Payment',
        'Payment Successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on StripeException catch (e) {
      print("Stripe error: ${e.error.localizedMessage}");
      Get.snackbar(
        'Payment Error',
        e.error.localizedMessage ?? 'Unknown error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print("Unexpected error: $e");
      Get.snackbar('Payment Error', 'An unexpected error occurred', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'sk_test_51Q5ThuGDacfWZqW7YVyZbw8Guo0l7sTTEZLDx3bNnPDnXxBesK1U8z7QeUCIdVmfie87yJIp19cdtiQF96Fx3TM600SfxoeswB', // Use your secret key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error creating payment intent: ${response.body}');
        throw Exception('Failed to create payment intent');
      }
    } catch (err) {
      print('Error charging user: ${err.toString()}');
      throw Exception('Failed to create payment intent');
    }
  }

  String calculateAmount(String amount) {
    return (int.parse(amount) * 100).toString(); // Convert to cents
  }
}
