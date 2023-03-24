import 'package:Kamataha/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(Kamatha());
}

// ignore: use_key_in_widget_constructors
class Kamatha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenHome(),
    );
  }
}
