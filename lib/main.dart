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
      home: const SplashScreen(), // Keep SplashScreen as the initial route
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
      // After 5 seconds, navigate to the LoginPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), // Changed navigation to LoginPage
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
              width: 400, // Adjusted width as requested
              height: 600, // Adjusted height as requested
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

// --- HomeScreen Widget (Dashboard View) ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Function to show logout confirmation dialog
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform logout actions (e.g., clear user session)
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()), // Navigate back to Login Page
                      (Route<dynamic> route) => false, // Remove all routes from the stack
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Red color for logout button
              ),
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String userName = "User"; // Placeholder for the user's name.

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light background for the dashboard
      body: SafeArea( // Ensures content isn't obscured by notches
        child: Column(
          children: <Widget>[
            // Custom Header Area
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi, $userName!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4C7D4C), // Darker green from logo
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Welcome to your dashboard.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  // Removed Logout Icon from header
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Very light green/off-white gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SingleChildScrollView( // Changed to SingleChildScrollView for column layout
                  padding: const EdgeInsets.all(16.0),
                  child: Column( // Changed from GridView.count to Column
                    children: <Widget>[
                      // --- Map View Card ---
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MapView()),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container( // Wrap with Container for defined size in column
                              width: double.infinity, // Take full width
                              padding: const EdgeInsets.all(20.0), // Inner padding for content
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.map, size: 60, color: const Color(0xFF6B8E23)),
                                  SizedBox(height: 10),
                                  Text(
                                    'Map View',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // --- Notification Card ---
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Notifications feature coming soon!')),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.notifications, size: 60, color: Colors.purple),
                                  SizedBox(height: 10),
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // --- Settings Card ---
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SettingsPage()), // Navigate to SettingsPage
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.settings, size: 60, color: Colors.orange),
                                  SizedBox(height: 10),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // --- Logout Card ---
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () => _showLogoutConfirmation(context),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.logout, size: 60, color: Colors.redAccent),
                                  SizedBox(height: 10),
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
      // Removed AppBar as requested
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
                    'Welcome Back!', // Reverted text on LoginPage
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
                      // Navigate to LoginLoadingScreen after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginLoadingScreen()),
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
                  // Updated "Create Account" option to LoginPage
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationPage()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Register Here", // Changed text as requested
                      style: TextStyle(color: const Color(0xFF4C7D4C), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10), // Spacing below create account button
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

// --- LoginLoadingScreen Widget ---
class LoginLoadingScreen extends StatefulWidget {
  const LoginLoadingScreen({super.key});

  @override
  State<LoginLoadingScreen> createState() => _LoginLoadingScreenState();
}

class _LoginLoadingScreenState extends State<LoginLoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 4 seconds (or adjust as needed for login simulation)
    Timer(const Duration(seconds: 4), () {
      // After 4 seconds, navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light background consistent with the app theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF6B8E23)), // Loading indicator color
              strokeWidth: 4,
            ),
            SizedBox(height: 20),
            Text(
              'Logging In...', // Greeting message for login
              style: TextStyle(
                color: const Color(0xFF4C7D4C),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Preparing your dashboard.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- RegistrationLoadingScreen Widget ---
class RegistrationLoadingScreen extends StatefulWidget {
  const RegistrationLoadingScreen({super.key});

  @override
  State<RegistrationLoadingScreen> createState() => _RegistrationLoadingScreenState();
}

class _RegistrationLoadingScreenState extends State<RegistrationLoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 4 seconds
    Timer(const Duration(seconds: 4), () {
      // After 4 seconds, navigate to the LoginPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light background consistent with the app theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF6B8E23)), // Loading indicator color
              strokeWidth: 4,
            ),
            SizedBox(height: 20),
            Text(
              'Creating Account...', // Greeting message
              style: TextStyle(
                color: const Color(0xFF4C7D4C),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please wait a moment.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// --- MapView Widget ---
class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows the body to extend behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: const Text(
          'Map View',
          style: TextStyle(
            color: Color(0xFF4C7D4C), // Text color for visibility on light background
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: const Color(0xFF4C7D4C), size: 28), // Darker icon for contrast
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen (HomeScreen)
          },
        ),
      ),
      body: Container( // Wrap the body in a Container for background control
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Consistent light gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Placeholder Image for a modern map look
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect( // Clip to apply border radius to the image
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://placehold.co/400x300/e0f0e0/4c7d4c?text=Modern+Map+View', // Placeholder with app theme colors
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9, // Responsive width
                    height: MediaQuery.of(context).size.height * 0.4, // Responsive height
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 100, color: Colors.red), // Fallback
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Interactive map features will be here.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Zoom, pan, and explore your surroundings.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening map settings...')),
                  );
                },
                icon: Icon(Icons.settings_overscan, color: Colors.white),
                label: Text(
                  'Map Settings',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B8E23), // Button color matching logo green
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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


// --- RegistrationPage Widget ---
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed AppBar and added custom back button
      body: Stack( // Use Stack to position the back button on top of the gradient background
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE0F0E0), Color(0xFFF0FFF0)], // Consistent light gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Custom back button at top-left
          Positioned(
            top: 40, // Adjust for status bar padding
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: const Color(0xFF4C7D4C), size: 28),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen (LoginPage)
              },
            ),
          ),
          Padding(
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
                        // Navigate to RegistrationLoadingScreen after clicking Register
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const RegistrationLoadingScreen()),
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
        ],
      ),
    );
  }
}
