
import 'package:anna_sakkoa/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: /* const*/  LoginPage(),  
      theme: lightMode,
      
    );
  }
}