import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  String locationMessage = 'Fetching location...';
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = 'Location services are disabled';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = 'Location permission denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = 'Location permission permanently denied';
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
        locationMessage =
        'Lat: ${position.latitude}, Long: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        locationMessage = 'Failed to get location';
      });
    }
  }

  Future<void> _openGoogleMaps() async {
    if (currentPosition != null) {
      final latitude = currentPosition!.latitude;
      final longitude = currentPosition!.longitude;

      const double destinationLatitude = 6.918799919047628;
      const double destinationLongitude = 79.8613329285715;

      final googleMapsUrl =
          'https://www.google.com/maps/dir/?api=1&origin=$latitude,$longitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';

      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Could not open Google Maps';
      }
    }
  }

  void _launchPhoneDialer() async {
    const phoneNumber = '+77 777 7777';
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Swipable photo row
            const Text(
              'Perfect Pair',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            Container(
              height: 200, // Adjust height as needed
              child: PageView(
                children: [
                  Image.asset('images/shop1.JPG', fit: BoxFit.cover),
                  Image.asset('images/shop2.jpg', fit: BoxFit.cover),
                  Image.asset('images/shop3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // About Us section
            const Text(
              'Who We Are',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'At Perfect Pair, we are passionate about delivering high-quality shoes that cater to all. With a diverse selection ranging from men\'s wear to kids\' sneakers, we ensure that every pair meets the highest standards of style and comfort.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'To provide our customers with the perfect pair of shoes for every occasion, ensuring comfort, durability, and style at affordable prices.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            const Text(
              'Our Vision',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We strive to be the leading provider of footwear, continuously innovating and expanding our collection to meet the evolving needs of our customers.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),

            const Text(
              'Location',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your Location: $locationMessage',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/storeplace.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            if (currentPosition != null)
              ElevatedButton(
                onPressed: _openGoogleMaps,
                child: const Text('Open in Google Maps'),
              ),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/about_banner.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _launchPhoneDialer,
              child: Text(
                'Phone: +77 777 7777',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[700],
                ),
              ),
            ),
            const SizedBox(height: 40),

            Center(
              child: Text(
                '© 2024 Perfect Pair. All rights reserved.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
