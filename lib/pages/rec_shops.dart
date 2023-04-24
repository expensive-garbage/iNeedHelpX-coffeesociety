import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/pages/widgets/cup_listing.dart';
import 'package:coffeesociety/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //add things here!
                NeuromorphicBox(
                    boomtitle: "Shop local",
                    subtext:
                        "${auth.currentUser!.displayName}, check out local shops and artist goodies in your area!"),
                //cup listings
                SizedBox(
                  height: 10,
                ),
                CupListing(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
