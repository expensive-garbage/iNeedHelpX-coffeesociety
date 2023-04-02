import 'package:flutter/material.dart';

class UnicornIcon extends StatelessWidget {
  const UnicornIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/uni.png',
          height: 25,
        ));
  }
}
