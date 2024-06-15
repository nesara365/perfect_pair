import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart';
import 'forgotP.dart';

class LoginPage extends StatelessWidget {
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
                  margin: EdgeInsets.symmetric(horizontal: 24.0),  //black opaque behind the content
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Let's Login",
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
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white70), //email and password inputs
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
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forgotP()),
                            );
                          },
                          child: Text(
                            'Forgotten password',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 37, 110, 220),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              pageBuilder: (context, animation, animationTime) =>     //fade transition between login and homepage
                              Home(),
                              transitionsBuilder: (context, animation, animationTime, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              }, 
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 37, 110, 220),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(            //login button
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
                      MaterialPageRoute(builder: (context) => Register()),   //register button route setup
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
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
