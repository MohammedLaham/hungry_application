import 'package:flutter/material.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/root.dart';
import 'package:food_application/splash.dart';

import 'features/auth/view/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry App',
      home: Root(),
    );
  }
}

