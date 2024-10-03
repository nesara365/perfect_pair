import 'package:flutter/material.dart';
import 'model/cart_model.dart';

class ShoeDetailPage extends StatefulWidget {
  final Map<String, dynamic> shoe;
  final VoidCallback toggleFavorite;

  const ShoeDetailPage({super.key, required this.shoe, required this.toggleFavorite});

  @override
  _ShoeDetailPageState createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  String selectedSize = 'N/A'; // Default size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: const Color.fromARGB(255, 37, 110, 220),
        actions: [
          IconButton(
            icon: Icon(
              widget.shoe['isFavorite'] ? Icons.favorite : Icons.favorite_border,
              color: widget.shoe['isFavorite'] ? Colors.red : null,
            ),
            onPressed: widget.toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.shoe['imageURL'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${widget.shoe['name']}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: ${widget.shoe['price']}',
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 10),

              DropdownButton<String>(
                value: selectedSize,
                onChanged: (String? newSize) {
                  setState(() {
                    selectedSize = newSize ?? 'N/A';
                  });
                },
                items: <String>['N/A', 'US 4', 'US 5', 'US 6', 'US 7','US 8','US 9','US 10']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Add buttons at the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cartModel.addToCart(widget.shoe, selectedSize);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${widget.shoe['name']} added to cart')),
                      );
                    },
                    child: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: const Text('Buy Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
