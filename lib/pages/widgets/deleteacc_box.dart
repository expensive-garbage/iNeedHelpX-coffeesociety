import 'package:coffeesociety/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text,
      required this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
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
              gradient: FlutterGradients.premiumDark(),
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
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 158, 121, 245),
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
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.text,
                    style: GoogleFonts.sniglet(
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 19, 2),
                        fontWeight: FontWeight.w800),
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
