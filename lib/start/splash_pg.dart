import 'package:coffeesociety/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prettyPurple,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/pink-coffee.json',
              animate: true,
            ),
            // SizedBox(
            //   height: 360,
            //   width: 360,
            //   child: Lottie.asset(
            //     'assets/98273-paper-plane.json',
            //     animate: true,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
