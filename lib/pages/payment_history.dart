import 'package:coffeesociety/colors/colours_list.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/pages/widgets/custombackbutton.dart';
import 'package:coffeesociety/pages/widgets/pay_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: plainBackButton(),
        // leading: IconButton(
        //   icon: Icon(Icons.close),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        backgroundColor: prettyPurple,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Order History",
          style: GoogleFonts.sniglet(fontSize: 30, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: stripePaymentsController.payments
                .map((e) => PaymentWidget(stripePaymentsModel: e))
                .toList(),
          )
        ],
      ),
    );
  }
}
