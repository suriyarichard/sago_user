import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  Widget _Name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Name", style: GoogleFonts.robotoMono(fontSize: 20)),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            // controller: namePerson,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: ""),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _lastname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Last Name", style: GoogleFonts.robotoMono(fontSize: 20)),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            // controller: namePerson,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: ""),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Email", style: GoogleFonts.robotoMono(fontSize: 20)),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            // controller: namePerson,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: ""),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget name() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).backgroundColor),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 20,
          ),
        ),
        Text("Name")
      ]),
    );
  }

  Widget lastname() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).backgroundColor),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 20,
          ),
        ),
        Text("Last Name")
      ]),
    );
  }

  Widget email() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).backgroundColor),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 20,
          ),
        ),
        Text("Email")
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.keyboard_double_arrow_right_outlined),
          name(),
          SizedBox(
            height: 10,
          ),
          email(),
          SizedBox(
            height: 10,
          ),

          lastname(),
          // Container(
          //   height: 50,
          //   width: 300,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Theme.of(context).backgroundColor),
          //   child: Row(children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Icon(
          //         Icons.keyboard_double_arrow_right_outlined,
          //         size: 20,
          //       ),
          //     ),
          //     Text("Name")
          //   ]),
          // ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Icon(Icons.keyboard_double_arrow_right_outlined),
                Text("Name")
              ],
            ),
          )
        ]),
      ),
    );
  }
}
