import 'package:flutter/material.dart';
import 'coffee_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.orange,
      ),
      // Mengatur halaman awal ke CoffeeHomeScreen
      home: CoffeeHomeScreen(),
    );
  }
}
