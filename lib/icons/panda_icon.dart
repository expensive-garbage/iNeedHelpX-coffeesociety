import 'package:flutter/material.dart';

class PandaIcon extends StatelessWidget {
  const PandaIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/panda.png',
          height: 25,
        ));
  }
}
