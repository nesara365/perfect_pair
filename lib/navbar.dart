import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 37, 110, 220),
              image: DecorationImage(
                image: AssetImage('images/Profileb.jpg'),   //Image on top of the sidebar
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.share),       //Sidebar in the Appbar options
            title: Text('Share'),
            onTap: () => print('Share tapped'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('About Us'),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact Us'),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () => print('Logout tapped'),
          ),
        ],
      ),
    );
  }
}
