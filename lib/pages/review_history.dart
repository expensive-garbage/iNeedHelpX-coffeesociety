import 'package:coffeesociety/colors/colours_list.dart';
import 'package:coffeesociety/pages/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewHistoryPage extends StatelessWidget {
  const ReviewHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: textturq3,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          plainBackButton(),
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            "Your Reviews",
                            style: GoogleFonts.sniglet(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              shadows: [
                                Shadow(
                                  offset: const Offset(8, 8.0),
                                  blurRadius: 17.0,
                                  color: fill2.withOpacity(0.6),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.red,
                        height: 200,
                        width: 200,
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
