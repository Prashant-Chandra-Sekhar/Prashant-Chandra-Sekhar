import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 195, 247), // Set background color

      appBar: AppBar(
        title: const Text('Name'),
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 222, 195, 247), // Lighter color at top
              Color.fromARGB(255, 185, 144, 232), // Darker color at bottom
            ],
          ),
        ),
        child: SingleChildScrollView( // Allow scrolling if content overflows
          padding: const EdgeInsets.all(20.0), // Add some padding

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally

            children: [
              // Profile picture section
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: CircleAvatar(
                  radius: 75.0,
                  backgroundColor: const Color.fromARGB(255, 255, 249, 193),
                  child: Text(
                    'Profile Photo',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              // Clubs and Organizations section
              const Text(
                'Clubs and Organizations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                ),
              ),

              const SizedBox(height: 8.0),

              // Text fields section
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      fillColor: Colors.white, // Set background color to white
                      filled: true, // Ensure the background is filled
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Additional properties for text field (e.g., maxLength)
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'School',
                      fillColor: Colors.white, // Set background color to white
                      filled: true, // Ensure the background is filled
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Additional properties for text field (e.g., maxLength)
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Organization',
                      fillColor: Colors.white, // Set background color to white
                      filled: true, // Ensure the background is filled
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Additional properties for text field (e.g., maxLength)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.pushReplacementNamed(context, '/'); // Navigate to the Home page
          }
        },
      ),
    );
  }
}
