import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  final String text;
  final String img;
  NoData({required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      color: Colors.white,
      // color: const Color.fromARGB(255, 255, 88, 88),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.network(img),
            // Lottie.network(
            //     "https://assets3.lottiefiles.com/packages/lf20_2K2lEIcWwq.json"),
            // Image.asset(
            //   'assets/nodata.png',
            //   width: 180.0,
            //   height: 180.0,
            // ),
            const SizedBox(height: 3.0),
            Text(
              text,
              style: TextStyle(fontSize: 17.0, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
