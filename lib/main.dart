import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'forgotP.dart';
import 'home.dart';
import 'landing.dart';
import 'login.dart';
import 'register.dart';
import 'nike.dart'; 
import 'adidas.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(PerfectPairApp());
}

class PerfectPairApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfect Pair',
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => PerfectPairHomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/forgotP': (context) => forgotP(),
        '/nike': (context) => Nike(),  // Define the new routes
        '/adidas': (context) => Adidas(),
        
      },
    );
  }
}

class DestinationPage extends StatelessWidget {
  final String name;

  DestinationPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color.fromARGB(255, 37, 110, 220),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to $name!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
