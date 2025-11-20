import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/feed_screen.dart';
import 'package:couldai_user_app/screens/create_content_screen.dart';
import 'package:couldai_user_app/screens/profile_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const FeedScreen(), // Watch
    const Center(child: Text("Discover")), // Placeholder
    const CreateContentScreen(), // Create
    const Center(child: Text("Inbox")), // Placeholder
    const ProfileScreen(), // Profile
  ];

  void _onItemTapped(int index) {
    // If "Create" is tapped (index 2), we might want to show it differently, 
    // but for now we just switch tabs or push a modal.
    // Let's treat it as a tab for simplicity in this version.
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded, size: 40, color: Colors.cyanAccent),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
