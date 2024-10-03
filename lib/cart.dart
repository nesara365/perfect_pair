import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/cart_model.dart'; // Import the cart model
import 'controller/payment_controller.dart'; // Import the PaymentController

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController()); // Initialize PaymentController

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: ValueNotifier(cartModel.items),
        builder: (context, List<Map<String, dynamic>> cartItems, child) {
          double totalPrice = cartItems.fold(0.0, (sum, item) {
            return sum + double.parse(item['price'].replaceAll('\$', ''));
          });

          return Column(
            children: [
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 24),
                  ),
                )
                    : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cartItems[index]['name']),
                      subtitle: Text('Price: ${cartItems[index]['price']} | Size: ${cartItems[index]['size']}'),
                      leading: Image.network(cartItems[index]['imageURL'], width: 50, height: 50),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartModel.removeFromCart(index); // Remove item from cart
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total: \$${totalPrice.toStringAsFixed(2)}', // Show total price
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Trigger the payment process
                        Navigator.pushNamed(context, '/payment'); // Navigate to the PaymentPage
                      },
                      child: const Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
