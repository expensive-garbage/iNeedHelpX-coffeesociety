import 'package:flutter/material.dart';

class ShoppingBagIcon extends StatelessWidget {
  const ShoppingBagIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/sb2.png',
          height: 25,
        ));
  }
}
