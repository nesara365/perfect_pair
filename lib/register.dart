import 'package:flutter/material.dart';
import 'login.dart';


class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(        //black opaque box behind codes
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Let's Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[800],
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.white70),    //username input
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[800],
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white70),    //email input
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[800],
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white70),        //Password n Confirm password with the hidepassword icon( icon yet to make it work)
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.white70,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[800],
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.white70,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),   //login page route from register
                        );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 37, 110, 220),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                  },
                  child: Text(
                    "Have an account? Login",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
