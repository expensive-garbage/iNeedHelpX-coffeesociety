import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PandaPage extends StatelessWidget {
  const PandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Hello ${auth.currentUser!.displayName}!",
                    style: GoogleFonts.sniglet(
                      fontSize: 22,
                      color: Color.fromARGB(255, 98, 7, 255),
                    ),
                    maxLines: 1,
                  ),
                ),
                NeuromorphicBox(
                    boomtitle: "Shop local",
                    subtext:
                        "${auth.currentUser!.displayName}, check out local shops and artist goodies in your area!"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
