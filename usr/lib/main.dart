import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/main_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Media App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.pinkAccent,
          secondary: Colors.cyanAccent,
          surface: Colors.grey[900]!,
        ),
      ),
      // Ensure routing is safe
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavScreen(),
      },
    );
  }
}
