import 'package:flutter/material.dart';

class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Confirmation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/tick.png'), // Use your local image asset
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
                borderRadius: BorderRadius.circular(10), // Rounded corners for the image
              ),
            ),
            const SizedBox(height: 20), // Spacing between image and text
            const Text(
              'Payment Successful',
              style: TextStyle(
                fontSize: 24, // Set the font size
                fontWeight: FontWeight.bold, // Bold text style
                color: Colors.green, // Change text color to green
              ),
            ),
          ],
        ),
      ),
    );
  }
}
