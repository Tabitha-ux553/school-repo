import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shool_repo/pages/home_page.dart';
import 'package:shool_repo/services/auth/login_or_register.dart';

//auth gate
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user is login
        if (snapshot.hasData) {
          return const HomePage();
        }

        //user is not login
        else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
