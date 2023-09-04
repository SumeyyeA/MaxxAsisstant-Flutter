import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maxxasisstantt/view/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
