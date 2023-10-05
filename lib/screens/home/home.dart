import 'package:ff/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String username = "Anapi";
  final AuthService _auth = AuthService();

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Welcome, $username'),
        centerTitle: false,
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
    );
  }
}
