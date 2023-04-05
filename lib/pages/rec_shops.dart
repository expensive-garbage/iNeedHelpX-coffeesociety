import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/pages/widgets/cup_listing.dart';
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
                //add things here!
                NeuromorphicBox(
                    boomtitle: "Shop local",
                    subtext:
                        "${auth.currentUser!.displayName}, check out local shops and artist goodies in your area!"),
                //cup listings
                CupListing(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
