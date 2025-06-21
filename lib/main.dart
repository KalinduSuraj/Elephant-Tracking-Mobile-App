// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async'; // Required for Timer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      theme: ThemeData(
        // Matching the theme to the logo colors (shades of green and grey)
        primarySwatch: Colors.green, // Primary color from the logo
        hintColor: Colors.grey[700], // Accent color from the logo
        fontFamily: 'Inter', // Applying the 'Inter' font
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}

// --- SplashScreen Widget ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 5 seconds
    Timer(const Duration(seconds: 5), () {
      // After 5 seconds, navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light grey background from the logo, ideal for a modern look
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- Logo in the Middle ---
            // Using the provided logo image from the 'images' folder.
            // Adjusted size for better fitting on various screens.
            Image.asset(
              'images/logo2.png', // Corrected path to your logo in the images folder and file type
              width: 250, // Adjusted width for better visibility and modern fit
              height: 250, // Adjusted height
              fit: BoxFit.contain, // Ensures the entire image fits
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error, size: 150, color: Colors.red), // Fallback icon in case of error
            ),
            // Removed the "WILDLIFE PROTECTION" and "RAILWAY SAFE PROJECT" text
            const SizedBox(height: 50), // Spacing above loading indicator
            // --- Loading Indicator at the Bottom ---
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF6B8E23)), // Loading indicator color matching a logo green
              strokeWidth: 4, // Thicker indicator
            ),
            const SizedBox(height: 10), // Spacing below loading indicator
            const Text(
              'Loading...',
              style: TextStyle(
                color: Color(0xFF4C7D4C), // Text color matching a logo green
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- HomeScreen Widget ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = "User"; // A placeholder for the user's name.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: const Color(0xFF4C7D4C), // AppBar color matching a logo green
      ),
      body: Container(
        decoration: const BoxDecoration(
          // Changed to a lighter, subtle green gradient for a modern look on the Home Screen
          gradient: LinearGradient(
            colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Very light green/off-white gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center( // Center widget to align content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.nature_people, // Changed icon to be more relevant
                size: 100,
                color: const Color(0xFF4C7D4C), // Icon color matching a darker logo green
              ),
              SizedBox(height: 20),
              // Welcome message with placeholder name
              Text(
                'Hi, $userName!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF4C7D4C), // Text color matching a darker logo green
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Spacing below the "Hi, Name" text
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Welcome to Wildlife Protection! Explore our initiatives for railway safety and wildlife preservation.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700], // Darker grey for body text
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30), // Spacing before the button
              // --- Login Button ---
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C7D4C), // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for the button
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15), // Spacing between buttons
              // --- Create Account Button ---
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4C7D4C), // Text color
                  side: BorderSide(color: const Color(0xFF4C7D4C), width: 2), // Border color and thickness
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for the button
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- LoginPage Widget ---
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF4C7D4C),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Consistent light gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView( // Allows scrolling if keyboard overlaps
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lock_open,
                    size: 80,
                    color: const Color(0xFF4C7D4C), // Icon color matching a darker logo green
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4C7D4C), // Text color matching a darker logo green
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey[700]), // Adjusted label color
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey[500]), // Adjusted hint color
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5), // Lighter fill for inputs
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color(0xFF4C7D4C), width: 2), // Focused border color
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.grey[700]), // Icon color
                    ),
                    style: TextStyle(color: Colors.grey[900]), // Input text color
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color(0xFF4C7D4C), width: 2),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                    ),
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to HomeScreen after login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C7D4C), // Button background color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Implement forgot password logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Forgot Password? functionality goes here.'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16), // Adjusted text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- RegistrationPage Widget ---
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: const Color(0xFF4C7D4C),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Consistent light gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView( // Allows scrolling if keyboard overlaps
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person_add,
                    size: 80,
                    color: const Color(0xFF4C7D4C), // Icon color matching a darker logo green
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Join Us!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4C7D4C), // Text color matching a darker logo green
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color(0xFF4C7D4C), width: 2),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                    ),
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color(0xFF4C7D4C), width: 2),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                    ),
                    style: TextStyle(color: Colors.grey[900]),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintText: 'Create a password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color(0xFF4C7D4C), width: 2),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                    ),
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Implement registration logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Create Account button pressed!'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      // Optionally navigate after successful registration, e.g., to login or home
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C7D4C), // Button background color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
