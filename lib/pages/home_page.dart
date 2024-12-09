import 'package:flutter/material.dart';
import 'package:shool_repo/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();

  //
  void logout() async {
    await _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text("loged in"),
            ),
            ElevatedButton(onPressed: logout, child: const Text("loged out"))
          ],
        ),
      ),
    );
  }
}
