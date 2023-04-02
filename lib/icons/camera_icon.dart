import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(
          'assets/icons/camera.png',
          height: 25,
        ));
  }
}
