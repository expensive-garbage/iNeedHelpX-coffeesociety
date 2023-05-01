import 'package:coffeesociety/pages/widgets/deleteacc_box.dart';
import 'package:flutter/material.dart';

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return DeleteAccDialogBox(
          title: "Delete Account?",
          descriptions: "This action deletes your account and all its data",
          text: "Delete");
    },
  );
}
