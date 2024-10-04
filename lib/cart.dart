import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      subtitle: Text(
                          'Price: ${cartItems[index]['price']} | Size: ${cartItems[index]['size']}'),
                      leading: Image.network(
                        cartItems[index]['imageURL'],
                        width: 50,
                        height: 50,
                      ),
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
                    // Stylish total price display
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[850], // Dark background
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8.0,
                            offset: const Offset(0, 4), // Shadow below the container
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        children: [
                          Text(
                            'Total:',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}', // Show total price
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Stylish checkout button
                    ElevatedButton(
                      onPressed: () {
                        // Trigger the payment process
                        Navigator.pushNamed(context, '/payment');
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        elevation: 5, // Add elevation for a shadow effect
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
