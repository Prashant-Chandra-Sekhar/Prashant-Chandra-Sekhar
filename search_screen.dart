import 'package:flutter/material.dart';

class ConsistentBottomNavigationItem extends BottomNavigationBarItem {
  ConsistentBottomNavigationItem({required Icon icon, required String label})
      : super(
          icon: icon,
          label: label,
          backgroundColor: Colors.pink[100], // Adjust background color as needed
          activeIcon: icon, // Use the same icon for active and inactive states
        );
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 240, 220, 255), // Lighter color at the top
              Color.fromARGB(255, 211, 172, 255), // Darker color at the bottom
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle search icon press
                            },
                            icon: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            Positioned(
              bottom: 20.0, // Adjust bottom padding if needed
              left: 0.0,
              right: 0.0,
              child: BottomNavigationBar(
                items: [
                  ConsistentBottomNavigationItem(icon: Icon(Icons.favorite), label: 'Heart'),
                  ConsistentBottomNavigationItem(icon: Icon(Icons.search), label: 'Search'),
                  ConsistentBottomNavigationItem(icon: Icon(Icons.home), label: 'Home'),
                ],
                onTap: (index) {
                  if (index == 2) {
                    Navigator.pushNamed(context, '/'); // Navigate to the Home page
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
