import 'package:coffeesociety/pages/widgets/listings_widget.dart';
import 'package:coffeesociety/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';

class CoffeeShopPage extends StatelessWidget {
  const CoffeeShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeuromorphicBox(
                  boomtitle: 'Shop listings',
                  subtext: 'This is the listings section',
                ),
                SizedBox(
                  height: 20,
                ),
                // CupListing(),
                //nearby shops
                CoffeeShopList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
