import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sago_user/Homescreen.dart';
import 'package:sago_user/firebase_options.dart';
import 'package:sago_user/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Homescreen(),
      home: Mainpage(),
    );
  }
}
