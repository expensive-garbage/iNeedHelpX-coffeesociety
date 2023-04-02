import 'package:coffeesociety/controllers/cart_controller.dart';
import 'package:coffeesociety/controllers/stripe_paycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffeesociety/controllers/login_controller.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here. this registers the controller
    Get.put(LoginController());
    Get.put(StripePaymentsController());
    Get.put(CartController());
  });
  runApp(Start());
}
