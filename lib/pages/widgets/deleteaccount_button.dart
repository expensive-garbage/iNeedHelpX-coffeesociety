import 'package:coffeesociety/colors/colours_list.dart';
import 'package:flutter/material.dart';

//not in use
class DeleteAccount extends StatelessWidget {
  const DeleteAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // background
        foregroundColor: gold,
        // foreground
      ),
      onPressed: () {
        //loginController.signOut();
        // authController.signOut();
      },
      child: Text('Delete Account'),
    );
  }
}
