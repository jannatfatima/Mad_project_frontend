import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cart.dart'; // Import the Cart class
import 'screens/splash.dart'; // Import your splash screen
import 'screens/home.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}