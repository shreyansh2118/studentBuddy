import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/login/loginPage.dart';
import 'package:studentapp/screens/selectActivity.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: loginFirst(),
    );
  }
}
