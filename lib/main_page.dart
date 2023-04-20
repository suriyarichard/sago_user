import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sago_user/auth/Authpage.dart';
import 'package:sago_user/homescreen.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homescreen();
          } else {
            // return LoginPage();
            return const AuthPage();
          }
        },
      ),
    );
  }
}
