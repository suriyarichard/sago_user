import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  // final _lastnameController = TextEditingController();
  // final _ageController = TextEditingController();

  Future signUp() async {
    bool success = false;
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: _emailController.text.trim(),
    //     password: _passwordController.text.trim());
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                  content: Text('Successfully registered !!'));
            });

        addUserDetails(
          _firstnameController.text.trim(),
          // _lastnameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
          // int.parse(_ageController.text.trim()),
        );

        success = true;
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
            msg: e.message ?? "Something went wrong",
            gravity: ToastGravity.TOP);
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    }
  }

  Future addUserDetails(
    String name,
    // String lastname,
    String email,
    String password,
    // int age
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      // 'last name': lastname,
      'email': email,
      'password': password,
      // 'age': age,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    // _lastnameController.dispose();
    // _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Lottie.network(
                      "https://assets3.lottiefiles.com/packages/lf20_dbqrrD.json"
                      // "https://assets1.lottiefiles.com/private_files/lf30_ul3enyal.json"
                      ),
                ),
                // hello
                // SizedBox(height: 25),
                Text(
                  "Register",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 36,
                  // ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create your new account",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 50),
                // first name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _firstnameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.ads_click_outlined),
                            hintText: "Enter Your name"),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         border: Border.all(color: Colors.white),
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 20.0),
                //       child: TextField(
                //         controller: _lastnameController,
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             icon: Icon(Icons.near_me),
                //             hintText: "Enter Last name"),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         border: Border.all(color: Colors.white),
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 20.0),
                //       child: TextField(
                //         controller: _ageController,
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             icon: Icon(Icons.email),
                //             hintText: "Enter Age"),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email),
                            hintText: "Enter Email"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            hintText: "Password"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            hintText: "Confirm password"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?"),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // email

                // password
                // sign
                // not a member
              ],
            ),
          ),
        ),
      ),
    );
  }
}
