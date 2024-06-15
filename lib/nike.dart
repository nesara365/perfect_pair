import 'package:flutter/material.dart';

class Nike extends StatelessWidget {
  final List<Map<String, String>> shoes = [
    {
      "name": "Black Jordan High",        //nike shoe list in the grid
      "price": "Rs. 50000",
      "image": "images/nike/nike1.png",
    },
    {
      "name": "Green Air Lows",
      "price": "Rs. 50000",
      "image": "images/nike/nike2.png",
    },
    {
      "name": "Black Zoomers",
      "price": "Rs. 50000",
      "image": "images/nike/nike3.png",
    },
    {
      "name": "Blue Jordan High",
      "price": "Rs. 50000",
      "image": "images/nike/nike4.png",
    },
    {
      "name": "Blue and Beige Airforce",
      "price": "Rs. 50000",
      "image": "images/nike/nike5.png",
    },
    {
      "name": "Grey and Blue Jordan High",
      "price": "Rs. 50000",
      "image": "images/nike/nike6.png",
    },
    {
      "name": "Red Streets",
      "price": "Rs. 50000",
      "image": "images/nike/nike7.png",
    },
    {
      "name": "Female White High",
      "price": "Rs. 50000",
      "image": "images/nike/nike8.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nike'),
        backgroundColor: Color.fromARGB(255, 30, 89, 176),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,      //gridview setup for the mobile
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          final shoe = shoes[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    shoe['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoe['name']!,
                    style: TextStyle(         //gridview box setup
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe['price']!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Nike(),
    ));
