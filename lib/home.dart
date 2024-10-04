import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:battery_plus/battery_plus.dart';
import 'navbar.dart';
import 'cart.dart';
import 'fav.dart';
import 'profile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'abtus.dart';
import 'bnavbar.dart';
import 'shoe_detail_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String selectedCategory = 'All'; // Default category is 'All'
  List<Map<String, dynamic>> favoriteShoes = []; // List to hold favorite shoes
  List<Map<String, dynamic>> shoes = [];
  String searchQuery = ''; //

  int batteryLevel = 0;
  bool _isSearching = false; // Flag to toggle search bar visibility
  TextEditingController _searchController = TextEditingController(); // Controller for search input

  @override
  void initState() {
    super.initState();
    loadShoes();
    getBatteryLevel(); // Get the battery level when initializing
  }

  Future<void> getBatteryLevel() async {
    final Battery battery = Battery();
    final int level = await battery.batteryLevel;
    setState(() {
      batteryLevel = level; // Update battery level state
    });
  }

  Future<void> loadShoes() async {
    // Load the JSON data from the file
    final String response = await rootBundle.loadString('assets/data002.json');
    final Map<String, dynamic> data = json.decode(response);

    // Convert the Map to a List of shoes
    setState(() {
      shoes = data.values.map((shoe) {
        return {
          'name': shoe['name'],
          'category': shoe['category'],
          'size': 'N/A',
          'price': '\$${shoe['price']}',
          'isFavorite': false,
          'imageURL': shoe['imageURL'],
        };
      }).toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavorite(Map<String, dynamic> shoe) {
    setState(() {
      shoe['isFavorite'] = !shoe['isFavorite'];
      if (shoe['isFavorite']) {
        favoriteShoes.add(shoe);
      } else {
        favoriteShoes.remove(shoe);
      }
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      searchQuery = '';
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter shoes based on gender
    List<Map<String, dynamic>> filteredShoes = shoes.where((shoe) {
      final matchesCategory = selectedCategory == 'All' || shoe['category'] == selectedCategory;
      final matchesSearch = shoe['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search shoes...',
            border: InputBorder.none,
          ),
          autofocus: true,
          onChanged: _updateSearchQuery,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Perfect Pair',
              style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.bold,),

            ),
            Text(
              '${batteryLevel}%', // Display battery level
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 37, 110, 220),
        centerTitle: true,
        actions: [
          _isSearching
              ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _stopSearch, // Stop the search
          )
              : IconButton(
            icon: const Icon(Icons.search),
            onPressed: _startSearch, // Start the search
          ),
        ],
      ),
      drawer: const Navbar(),
      body: _selectedIndex == 0
          ? Column(
        children: [
          // Category buttons for All, Men's, Women's, and Kids' wear
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'All'; // Show all shoes
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'All' ? Colors.blue : Colors.white,
                  ),
                  child: const Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Men';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Men' ? Colors.blue : Colors.white,
                  ),
                  child: const Text('Men'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Women';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Women' ? Colors.blue : Colors.white,
                  ),
                  child: const Text('Women'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Kids';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Kids' ? Colors.blue : Colors.white,
                  ),
                  child: const Text('Kids'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards in each row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Adjust card height
                ),
                itemCount: filteredShoes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeDetailPage(
                            shoe: filteredShoes[index],
                            toggleFavorite: () => _toggleFavorite(filteredShoes[index]),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(filteredShoes[index]['imageURL'], height: 100), // Add image
                          Text(
                            filteredShoes[index]['name'],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Price: ${filteredShoes[index]['price']}',
                            style: const TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          IconButton(
                            icon: Icon(
                              filteredShoes[index]['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: filteredShoes[index]['isFavorite'] ? Colors.red : null,
                            ),
                            onPressed: () {
                              _toggleFavorite(filteredShoes[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )
          : _selectedIndex == 1
          ? const CartPage() // Display the cart page
          : _selectedIndex == 2
          ? FavoritesPage(
        shoes: favoriteShoes,
        onToggleFavorite: _toggleFavorite,
      )
          : _selectedIndex == 3 // Add this case for Profile Page
          ? const ProfilePage() // Display the Profile page
          : const AboutPage(), // Default case // Display the About page
      bottomNavigationBar: BNavbar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
