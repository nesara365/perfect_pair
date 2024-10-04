import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your payment details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Card Number Field
              _buildTextField(
                label: 'Card Number',
                hint: 'XXXX XXXX XXXX XXXX',
                icon: Icons.credit_card,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Expiration Date and CVC Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Expiration Date (MM/YY)',
                      hint: 'MM/YY',
                      icon: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      label: 'CVC',
                      hint: 'XXX',
                      icon: Icons.lock,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Cardholder Name Field
              _buildTextField(
                label: 'Cardholder Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 16),

              // Billing Address Field
              _buildTextField(
                label: 'Billing Address',
                hint: '123 Main St',
                icon: Icons.location_on,
              ),
              const SizedBox(height: 16),

              // Postal Code and Country Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Postal Code',
                      icon: Icons.local_post_office,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      label: 'Country',
                      icon: Icons.flag,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Email Field
              _buildTextField(
                label: 'Email',
                hint: 'example@email.com',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              _buildTextField(
                label: 'Phone Number',
                hint: '+1 (555) 555-5555',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Submit Payment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/confirmpayment');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent, // Button color
                    elevation: 5, // Add shadow effect
                  ),
                  child: const Text(
                    'Submit Payment',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Set button font color to white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build styled text fields
  Widget _buildTextField({required String label, String? hint, required IconData icon, TextInputType? keyboardType}) {
    return TextField(
      style: const TextStyle(color: Colors.black), // Set text field font color to black
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200], // Light background for the text field
        prefixIcon: Icon(icon),
      ),
      keyboardType: keyboardType,
    );
  }
}
