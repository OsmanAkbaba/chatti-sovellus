import 'package:anna_sakkoa/services/auth/login_or-register.dart';
import 'package:anna_sakkoa/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user is logged in
        if (snapshot.hasData) {
          return HomePage();
        }
        //user is not logged in
        else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
