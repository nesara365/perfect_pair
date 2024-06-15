import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text('Favorites', style: TextStyle(fontSize: 24)),
    NotificationsPage(),    // 4 options in the nav bar
    ProfilePage(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(      //top app bar
          'Perfect Pair',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 37, 110, 220),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),     //right top search bar in the app bar
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
        ],
      ),
      drawer: Navbar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),      //modifications of the 4 Option nav bar
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
        unselectedItemColor: Color.fromARGB(255, 185, 185, 198),
        backgroundColor: Color.fromARGB(255, 37, 110, 220), 
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Nike',
      'image': 'images/nike.jpg',              //list in the home page
      'route': '/nike',
    },
    {
      'name': 'Adidas',
      'image': 'images/adidas.png',
      'route': '/adidas',
    },
    {
      'name': 'Converse',
      'image': 'images/converse.jpg',
      'route': '/converse',
    },
    {
      'name': 'Reebok',
      'image': 'images/reebok.jpg',
      'route': '/reebok',
    },
    {
      'name': 'Lacoste',
      'image': 'images/lacoste.jpg',
      'route': '/lacoste',
    },
  ];

final List<Map<String, String>> nikeShoes = [
    {
      "name": "Black Jordan High",
      "price": "Rs. 50000",
      "image": "images/nike/nike1.png",         //Nike page shoe grid list
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

  final List<Map<String, String>> adidasShoes = [
    {
      "name": "Beige and Black walker",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas1.jpg",
    },
    {
      "name": "Gazelle Blue",
      "price": "Rs. 50000",
      "image": "images/adidas/adidas2.png",             //Adidas page shoe grid list
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Brands:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),
            ),
            SizedBox(height: 16),
            Column(
              children: destinations.map((destination) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),       //grid modifications in the nike, adidas and etc.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double imageHeight = constraints.maxWidth > constraints.maxHeight
                              ? constraints.maxHeight * 0.6
                              : constraints.maxWidth * 0.6;
                          return Image.asset(
                            destination['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: imageHeight,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          destination['name']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, destination['route']!);
                            },                           //more details destination route move
                            child: Text(
                              'More Details...',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;

  NotificationItem({required this.title, required this.subtitle});

  @override                                 //notification page layout
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [   //decoy notifications
    {'title': 'New Stock!!!', 'subtitle': 'Nike new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Adidas new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Converse new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Reebok new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Lacoste new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Nike new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Adidas new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Converse new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Reebok new stocks in.'},
    {'title': 'New Stock!!!', 'subtitle': 'Lacoste new stocks in.'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(                         //notification logic
              'Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                  title: notifications[index]['title']!,
                  subtitle: notifications[index]['subtitle']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [             //profile page layout
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/Profile.jpg'),
              ),
              const SizedBox(height: 25),
              itemProfile('Name', 'Rosalie', CupertinoIcons.person),

              const SizedBox(height: 25),
              itemProfile('Email', 'rosaliedawson@gmail.com', CupertinoIcons.mail),

              const SizedBox(height: 25),
              itemProfile('Phone', '075234568', CupertinoIcons.phone),

              const SizedBox(height: 25),
              itemProfile('Address', 'abc address, Colombo', CupertinoIcons.location),

              const SizedBox(height: 25), 
              ElevatedButton(
                onPressed: () {},
                child: const Text('Edit profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(        //profile page logic/setup
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.indigo.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 11,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.black),
        tileColor: Colors.white,
      ),
    );
  }
}




class Search extends SearchDelegate<String> {
  final List<Map<String, String>> shoeBrands = [
    {
      'name': 'Nike',
      'image': 'images/nike.jpg',
      'route': '/nike',
    },
    {
      'name': 'Adidas',
      'image': 'images/adidas.png',
      'route': '/adidas',
    },
    {
      'name': 'Converse',
      'image': 'images/converse.jpg',
      'route': '/converse',
    },
    {
      'name': 'Reebok',
      'image': 'images/reebok.jpg',
      'route': '/reebok',
    },
    {
      'name': 'Lacoste',
      'image': 'images/lacoste.jpg',
      'route': '/lacoste',
    },
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = shoeBrands
        .where((brand) => brand['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(results[index]['image']!, width: 50, height: 50),
          title: Text(results[index]['name']!),
          onTap: () {
            Navigator.pushNamed(context, results[index]['route']!);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = shoeBrands
        .where((brand) => brand['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(suggestions[index]['image']!, width: 50, height: 50),
          title: Text(suggestions[index]['name']!),
          onTap: () {
            query = suggestions[index]['name']!;
            showResults(context);
          },
        );
      },
    );
  }
}
