import 'package:flutter/material.dart';

class Adidas extends StatelessWidget {  //gridview list for the adidas shoes
  final List<Map<String, String>> shoes = [
    {
      "name": "Beige and Black walker",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas1.jpg",
    },
    {
      "name": "Gazelle Blue",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas2.png",
    },
    {
      "name": "Gazelle White",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas3.png",
    },
    {
      "name": "Black and Beige Samba",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas4.png",
    },
    {
      "name": "White and Black Samba",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas5.png",
    },
    {
      "name": "Responsive Super",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas6.png",
    },
    {
      "name": "Ultra Bounce",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas7.png",
    },
    {
      "name": "Grip-Ed Run",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas8.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adidas'),
        backgroundColor: const Color.fromARGB(255, 30, 89, 176),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,    //grid layout
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
                  child: Image.asset(   //images of the shoes
                    shoe['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoe['name']!,    //name of the shoes
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe['price']!,     //price of the shoes
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
      home: Adidas(),
    ));
