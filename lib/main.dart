import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:madf/firebase_options.dart';
import 'package:madf/cart.dart';
import 'package:madf/abtus.dart';
import 'forgotP.dart';
import 'home.dart';
import 'landing.dart';
import 'login.dart';
import 'register.dart';
import 'payment.dart';
import 'confirmpayment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Stripe
  //Stripe.publishableKey = 'pk_test_51Q5ThuGDacfWZqW7a9lqAlJlIhBUXEkk6sISX1as25cZ2Q8IFozlhQyWAJARNnentUkyJxVBZW6VFi7vgOCz9TlC00qyZZBHg2'; // Add your Stripe publishable key here

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const PerfectPairApp());
}

class PerfectPairApp extends StatelessWidget {
  const PerfectPairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfect Pair',
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const PerfectPairHomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const Register(),
        '/home': (context) => const Home(),
        '/forgotP': (context) => const forgotP(),
        '/cart': (context) => const CartPage(),
        '/about': (context) => const AboutPage(),
        '/payment': (context) => const PaymentPage(),
        '/confirmpayment': (context) => const ConfirmPaymentPage(),
      },
    );
  }
}

class DestinationPage extends StatelessWidget {
  final String name;

  const DestinationPage({super.key, required this.name});

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
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
