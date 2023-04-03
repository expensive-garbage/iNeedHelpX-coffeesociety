import 'package:coffeesociety/api/url_request.dart';
import 'package:coffeesociety/colors/colours_list.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/pages/review_history.dart';
import 'package:coffeesociety/pages/widgets/custom_button.dart';
import 'package:coffeesociety/pages/widgets/settings_card.dart';
import 'package:coffeesociety/start/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //settings text here
                  Text(
                    "Settings",
                    style: GoogleFonts.courgette(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 93, 92, 103),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //settings card list
                  //this one here is for the user to add/edit their credit card details
                  SettingCard(
                      titleText: "Credit card",
                      subText: "add/view your credit card info",
                      icon: Icon(
                        Icons.credit_card_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      onTap: () {
                        //get to the creditcard page
                        Get.snackbar(
                          "test",
                          "this is a test",
                          duration: Duration(seconds: 1),
                        );
                      }),
                  SettingCard(
                      titleText: "Review History",
                      subText: "View or edit your reviews",
                      icon: Icon(
                        Icons.history_edu,
                        size: 40,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Get.to(ReviewHistoryPage());
                      }),
                  //order history
                  SettingCard(
                      titleText: "Order History",
                      subText: "view order history",
                      icon: Icon(
                        Icons.history,
                        size: 40,
                        color: Colors.black,
                      ),
                      onTap: () {
                        stripePaymentsController.getPaymentHistory();
                      }),
                  SettingCard(
                      titleText: "luanch QR code",
                      subText: "Developer's website",
                      icon: Icon(
                        Icons.qr_code_2_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      onTap: () {
                        //qr code for my site
                        bottomSheet(context);
                      }),
//end of settings card list

                  SizedBox(
                    height: 20,
                  ),
                  //link to NextDoor
                  InkWell(
                    highlightColor:
                        Color.fromARGB(255, 165, 145, 255).withOpacity(0.8),
                    splashColor:
                        Color.fromARGB(255, 165, 145, 255).withOpacity(0.5),
                    child: Text(
                      "Join us on NextDoor to see our \n weekly meet-ups! click here",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sniglet(
                        fontSize: 20,
                        // fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 7, 247),
                      ),
                    ),
                    onTap: () {
                      UrlHelper.launchUrl(
                          "https://ca.nextdoor.com/g/6n9tlgppf/");
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: "Logout",
                      bgColor: prettyPurple,
                      onTap: () {
                        loginController.signOut();
                      }),
                  //space between logout button and text link
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    highlightColor: Color.fromARGB(255, 28, 251, 207),
                    splashColor: Color.fromARGB(255, 102, 255, 240),
                    child: Text(
                      "Developed by Julia Pak \n click here for website",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sniglet(
                        fontSize: 16,
                        color: Color.fromARGB(255, 98, 7, 255),
                      ),
                    ),
                    onTap: () {
                      UrlHelper.launchUrl("https://juliapak.tech");
                    },
                  ),

                  // PurpleLogout(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PurpleLogout extends StatelessWidget {
  const PurpleLogout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent, // background
        foregroundColor: gold,
        // foreground
      ),
      onPressed: () {
        loginController.signOut();
        // authController.signOut();
      },
      child: Text('Logout'),
    );
  }
}
