import 'package:flutter/material.dart';

/// Octopus icon
class OctopusIcon extends StatelessWidget {
  const OctopusIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/octopus.png',
          height: 25,
        ));
  }
}
