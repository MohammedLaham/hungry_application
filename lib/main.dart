import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/splash.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      title: 'Hungry App',
      home: LoginView(),
    );
  }
}

