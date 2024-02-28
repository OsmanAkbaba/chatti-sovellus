import 'package:anna_sakkoa/services/auth/auth_gate.dart';

import 'package:anna_sakkoa/firebase_options.dart';
import 'package:anna_sakkoa/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: /* const*/const  AuthGate(),
      theme: lightMode,
    );
  }
}
