import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Apply a custom theme for consistent colors
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set white background
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DatingAppHomePage(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}
class DatingAppHomePage extends StatelessWidget {
  @override

Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, // Gradient starts from top
          end: Alignment.bottomCenter, // Gradient ends at bottom
          colors: [
            Color.fromARGB(255, 222, 195, 247), // Lighter color at top
            Color.fromARGB(255, 185, 144, 232), // Darker color at bottom
          ],
        ),
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to HeartyDates',
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 250, 250), // Set text color
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Sign Up and find your pair Now!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Log In button press
                },
                child: Text(
                  'Log In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      appBar: AppBar(
  title: Text(''),
  centerTitle: true,
  backgroundColor: const Color.fromARGB(255, 222, 195, 247),
  leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    },
  ),
),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 172, 255), // Set drawer header background color
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white, // Set drawer header text color
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: Text('Search'),
              onTap: () => Navigator.pushNamed(context, '/search'),
            ),
          ],
        ),
      ),
    );
  }
}
