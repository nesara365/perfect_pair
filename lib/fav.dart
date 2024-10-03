import 'package:flutter/material.dart';
import 'shoe_detail_page.dart'; // Import the ShoeDetailPage

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> shoes; // List of favorite shoes
  final Function(Map<String, dynamic>) onToggleFavorite; // Callback to toggle favorites

  const FavoritesPage({
    super.key,
    required this.shoes,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: shoes.isEmpty
            ? const Center(child: Text('No favorite items yet!'))
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards in each row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7, // Adjust card height
          ),
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the ShoeDetailPage when the card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShoeDetailPage(
                      shoe: shoes[index],
                      toggleFavorite: () => onToggleFavorite(shoes[index]),
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the shoe image
                    Image.network(
                      shoes[index]['imageURL'],
                      height: 100, // Set the height for the image
                      fit: BoxFit.cover, // Maintain aspect ratio
                    ),
                    const SizedBox(height: 10),
                    Text(
                      shoes[index]['name'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price: ${shoes[index]['price']}',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Call the toggle function when the favorite icon is pressed
                        onToggleFavorite(shoes[index]);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
