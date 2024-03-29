import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sago_user/screen/authCheck/main_page.dart';
import 'package:sago_user/services/user.service.dart';
import 'package:sago_user/shared/nodata.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserService userService = UserService();
  List<dynamic> historyData = [];
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // String name = '';
  // String emails = '';
  // // String bio = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  //   print("kkd$name");
  // }

  // Future<void> _getData(String id) async {
  //   final ref = FirebaseFirestore.instance.collection('users').doc(id);
  //   final snapshot = await ref.get();
  //   final data = snapshot.data();
  //   setState(() {
  //     name = data!['name'];
  //     emails = data['email'];
  //     print("djsjj$name");
  //     // bio = data['bio'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              title: Text(
                'My Account',
                // style: GoogleFonts.rubik(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 25,
                //     color: AppColor.titleColor),
              ),
              subtitle: Text(
                'Your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: userService.get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading spinner while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if the future throws an error
            return Text("Error: ${snapshot.error}");
          } else {
            historyData = snapshot.data;
            // print("hello ${snapshot.data['Name']}");
            // Call the function from the instance of MyClass and display the fetched data
            if (historyData.length == 0) {
              return NoData(
                text: 'No Profile Available',
                img:
                    'https://assets8.lottiefiles.com/packages/lf20_xyadoh9h.json',
              );
            } else {
              // Call the function from the instance of MyClass and display the fetched data

              // return Text(snapshot.data[0]['totalweight'].toString());
              // return Text(snapshot.data[0]['name'].toString());
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.network(
                              "https://assets8.lottiefiles.com/packages/lf20_xyadoh9h.json"),

                          // const Padding(
                          //   padding: EdgeInsets.only(top: 10.0),
                          //   child:

                          //   // child: CircleAvatar(
                          //   // Lottie.network('https://assets8.lottiefiles.com/packages/lf20_xyadoh9h.json'),
                          //   //   maxRadius: 80,
                          //   // ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Name:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  snapshot.data[0]['name'].toString(),
                                  // "Suriyaprakash",
                                  // data['name'],
                                  style: const TextStyle(
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
                              children: [
                                const Text(
                                  "Email:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  snapshot.data[0]['email'].toString(),
                                  // emails,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])
                  ]));
            }
          }
        },
      ),
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const SizedBox(
      //           height: 150,
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             const Padding(
      //               padding: EdgeInsets.only(top: 10.0),
      //               child: CircleAvatar(
      //                 backgroundImage: NetworkImage(
      //                     'https://cdn-icons-png.flaticon.com/512/206/206865.png'),
      //                 maxRadius: 80,
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   const Text(
      //                     "Name:",
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 20,
      //                       color: Colors.black,
      //                     ),
      //                   ),
      //                   Text(
      //                     name,
      //                     // "Suriyaprakash",
      //                     // data['name'],
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   const Text(
      //                     "Email:",
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                   Text(
      //                     emails,
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      // const SizedBox(
      //   height: 20,
      // ),
      // SizedBox(
      //   width: 120,
      //   height: 50,
      //   child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.lightGreen,
      //       ),
      //       onPressed: () {
      //         // authService.signOut();
      //         FirebaseAuth.instance.signOut();
      //         Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(
      //                 builder: ((context) => Mainpage())));
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text("Successfully Logout"),
      //             backgroundColor: Color.fromRGBO(0, 0, 0, 65),
      //             behavior: SnackBarBehavior.floating,
      //             elevation: 10,
      //             action: SnackBarAction(
      //               label: 'Dismiss',
      //               textColor: Colors.white,
      //               onPressed: () {},
      //             ),
      //           ),
      //         );
      //         // showSnackBar(context, " Successfully Logout");
      //       },
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: const [
      //           Text("Logout"),
      //           Icon(Icons.exit_to_app),
      //   ],
      // )
      // ),
      // ),
      //   ],
      // ),
      //   ],
      // ),
      // ),
      // ),
    );
  }
}
