import 'package:coffeesociety/pages/rec_shops.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffeesociety/colors/colours_list.dart';
import 'package:coffeesociety/pages/account_page.dart';
import 'package:coffeesociety/pages/coffeeshop_page.dart';
import 'package:coffeesociety/start/app_bars/listbaricons.dart';
import 'package:coffeesociety/start/app_bars/radialbar.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:new_version/new_version.dart';

class AppSetup extends StatefulWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  AppSetupState createState() => AppSetupState();
}

class AppSetupState extends State<AppSetup> {
  int selectedpage = 0;

  final _pageOptions = [
//pages
    // PandaPage(),
    CoffeeCupPage(),
    RecommendedPage(),
    AccountPage(),
  ];
  @override
  void initState() {
    super.initState();
    _checkVersion();
  }

  CurvedNavigationBar curvedNavBar() {
    return CurvedNavigationBar(
      index: selectedpage,
      buttonBackgroundColor: Color.fromARGB(255, 254, 29, 217),
      color: barback.withOpacity(0.9),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      items: listBarIcons(),
      onTap: (index) {
        setState(() {
          selectedpage =
              index; // changing selected page as per bar index selected by the user
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradients.confidentCloud(
          type: GradientType.linear,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        // backgroundColor: bg,

        extendBodyBehindAppBar: true,
        appBar: myRadialBar(context),
        body: _pageOptions[selectedpage],
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: curvedNavBar(),
      ),
    );
  }

//bottom sheet
  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: prettyPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        context: context,
        builder: (BuildContext context) {
//return something!!
          return Stack(
            children: [
              SizedBox(
                height: 100,
              ),
              Text("replace")
            ],
          );
        });
  }

  void _checkVersion() {
    final newVersion = NewVersion(
      androidId: "com.juliapak.coffeesociety",
      iOSId: "com.juliapak.coffeesociety",
    );
    newVersion.showAlertIfNecessary(context: context);
  }
}
