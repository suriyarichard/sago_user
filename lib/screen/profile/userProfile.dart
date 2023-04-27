import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sago_user/screen/authCheck/main_page.dart';
import 'package:sago_user/services/user.service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final data = UserService().get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              title: Text(
                'Account',
                // style: GoogleFonts.rubik(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 25,
                //     color: AppColor.titleColor),
              ),
              subtitle: Text(
                'your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/206/206865.png'),
                      maxRadius: 80,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Name:",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Suriyaprakash",
                          // data['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "UserId:",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '123456',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                        ),
                        onPressed: () {
                          // authService.signOut();
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => Mainpage())));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Successfully Logout"),
                              backgroundColor: Color.fromRGBO(0, 0, 0, 65),
                              behavior: SnackBarBehavior.floating,
                              elevation: 10,
                              action: SnackBarAction(
                                label: 'Dismiss',
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          );
                          // showSnackBar(context, " Successfully Logout");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Logout"),
                            Icon(Icons.exit_to_app),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
