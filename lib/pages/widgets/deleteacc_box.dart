import 'package:coffeesociety/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccDialogBox extends StatefulWidget {
  final String title, descriptions, tapText;
  // final Image? img;

  const DeleteAccDialogBox({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.tapText,
  }) : super(key: key);

  @override
  _DeleteAccDialogBoxState createState() => _DeleteAccDialogBoxState();
}

class _DeleteAccDialogBoxState extends State<DeleteAccDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //dark gradient
              gradient: FlutterGradients.premiumDark(tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: GoogleFonts.sniglet(
                  color: Color.fromARGB(255, 132, 106, 250),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 224, 248, 251)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    //what happens when the user presses the delete button
                    Get.back();
                    //Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.tapText,
                    style: GoogleFonts.sniglet(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 7, 193),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/icons/user.png")),
          ),
        ),
      ],
    );
  }
}
