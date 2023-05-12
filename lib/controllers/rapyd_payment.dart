import 'package:coffeesociety/colors/colours_list.dart';
import 'package:coffeesociety/config/config.dart';
import 'package:coffeesociety/controllers/cupinfo_controller.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapyd/models/customer.dart';
import 'package:rapyd/rapyd.dart';

//process payment
class RapydPayments extends GetxController {
  static RapydPayments instance = Get.find();
  static CupInfoController cupController = Get.find();
  int? index = 0;
  // CustomerData? _cust;
  // CustomerData? get customer => _cust;
  // Rxn<User> fbUser = Rxn<User>();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

//check if rapydClient
  void checkRapydCust() async {
    final customer = await getCustomer(rapydClient);
    //check if the customer is already registered
    if (customer.data.email == auth.currentUser!.email) {
      print("hello you are already registered! ${auth.currentUser!.email}");
      Get.snackbar(
        "Thank you for registering!",
        "You are registered for a Rapyd Customer Account",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.black,
        icon: Icon(
          Icons.credit_score,
          size: 36,
          color: Color.fromARGB(255, 253, 4, 162),
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 4),
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 122, 255, 149),
            Color.fromARGB(255, 21, 224, 255),
            Color.fromARGB(255, 255, 212, 21),
            Color.fromARGB(255, 255, 21, 177),
            Color.fromARGB(255, 45, 17, 255)
          ],
        ),
        backgroundColor: Colors.white,
      );
      return;
    } else if (customer.data.email != auth.currentUser!.email) {
      print(
          "${customer.data.email} is going to be registered on rapyd payment");
      createRapydCustomer();
      Get.snackbar("Thank you for registering as a Rapyd Customer",
          "You are now registered on Rapyd Payments",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.black,
          duration: Duration(seconds: 4),
          backgroundColor: textturq);
    }
  }

  void createRapydCustomer() async {
    final rapydClient =
        RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);

    try {
      final customer = await getCustomer(rapydClient);

      print('Created customer successfully, name: ${customer.data.id}');
      if (customer.data.email == auth.currentUser!.email!) return;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  void createPayment() async {
    final customer = await getCustomer(rapydClient);
    print("${customer.data.email}");
    print("${cupController.cups[index!].price!}");
    try {
      // need to create payment here
      print('Payment successful, amount: ${cupController.cups[index!].price!}');
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<Customer> getCustomer(RapydClient rapydClient) async {
    return await rapydClient.createNewCustomer(
      email: auth.currentUser!.email!,
      name: auth.currentUser!.displayName!,
    );
  }

//view country code
  void viewCountryCodes() async {
    final rapydClient =
        RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);
    try {
      final country =
          await rapydClient.retrieveCheckout(checkoutId: checkoutId);
      print('Country: ${country.data.name}');
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  // void viewCountryCodes() async {
  //   final rapydClient =
  //       RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);
  //   try {
  //     final country = await rapydClient.getCountry();
  //     print('Country: ${country.data.name}');
  //   } catch (e) {
  //     print('ERROR: ${e.toString()}');
  //   }
  // }

  // void createRapydCustomer(UserModel usr) async {
  //   final rapydClient =
  //       RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);

  //   try {
  //     final customer = await rapydClient.createNewCustomer(
  //       email: usr.email!,
  //       name: usr.name!,
  //     );

  //     print('Created customer successfully, name: ${customer.data.name}');
  //     if (customer.data.email == usr.email) return;
  //   } catch (e) {
  //     print('ERROR: ${e.toString()}');
  //   }
  // }
}
