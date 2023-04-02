import 'dart:convert';
import 'package:coffeesociety/config/config.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/models/stripepay_model.dart';
import 'package:coffeesociety/pages/payment_history.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

//for stripe payments
class StripePaymentsController extends GetxController {
  static StripePaymentsController instance = Get.find();
  String collection = "payments";
  List<StripePaymentsModel> payments = [];
  Map<String, dynamic>? _paymentSheetData;
  Rx<double> totalCost = 0.0.obs;
  // @override
  // void onInit() {
  //   super.onInit();

  //}

  @override
  void onReady() {
    super.onReady();
    Stripe.publishableKey = Configurations().stripePublishableKeyTest;
    Stripe.merchantIdentifier = 'MerchantIdentifier';
  }

  createPaymentMethod() {
    _initPaymentSheet();
    if (_paymentSheetData != null) {
      _displayPaymentSheet();
    }

    //Stripe.instance.isApplePaySupported.value ? handlePayPress() : () {};
  }

  Future<void> _initPaymentSheet() async {
    try {
      // 1. create payment intent on the server
      _paymentSheetData = await _createTestPaymentSheet();

      print("paymentsheet data is ${_paymentSheetData!['paymentIntent']}");

      if (_paymentSheetData!['error'] != null) {
        Get.snackbar('ErrorCode', '${_paymentSheetData!['error']}');
        return;
      }
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: PaymentSheetApplePay(merchantCountryCode: "CA"),
        googlePay: PaymentSheetGooglePay(merchantCountryCode: "CA"),
        merchantDisplayName: "Coffee Society",
        customerId: _paymentSheetData!['customer'],
        paymentIntentClientSecret: _paymentSheetData!['paymentIntent'],
        customerEphemeralKeySecret: _paymentSheetData!['ephemeralKey'],
      ));
      _displayPaymentSheet();
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  Future<void> _displayPaymentSheet() async {
    String customerId = _paymentSheetData!['customer'];
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      _paymentSheetData = null;

      Get.snackbar('Coffee Society', 'Payment succesfully completed');
      _addToCollection(paymentId: customerId, paymentStatus: 'success');
      auth.userChanges();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<Map<String, dynamic>> _createTestPaymentSheet() async {
    double totalCosttodouble = totalCost.toDouble();
    totalCosttodouble = (cartController.totalCartPrice.value / 156);
    int amount = (totalCosttodouble * 100).toInt();
    final url = Uri.parse(Configurations().stripeFuncUrl);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': loginController.userModel.value.email,
          'currency': 'cad',
          'amount': amount,
          'items': [
            {'id': 'id'}
          ],
          'request_three_d_secure': 'any',
        }));
    return json.decode(response.body);
  }

  _addToCollection({String? paymentStatus, String? paymentId}) {
    String id = Uuid().v1();
    firebaseFirestore.collection(collection).doc(id).set({
      "id": id,
      "clientId": loginController.userModel.value.id,
      "status": paymentStatus,
      "paymentId": paymentId,
      "cart": loginController.userModel.value.cartItemsToJson(),
      "amount": cartController.totalCartPrice.value.toStringAsFixed(2),
      "createdAt": DateTime.now().microsecondsSinceEpoch,
    });
  }

  getPaymentHistory() {
    // showLoading();
    payments.clear();
    firebaseFirestore
        .collection(collection)
        .where("clientId", isEqualTo: loginController.userModel.value.id)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        StripePaymentsModel payment = StripePaymentsModel.fromMap(doc.data());
        payments.add(payment);
      });

      logger.i("length ${payments.length}");
      // dismissLoadingWidget();
      Get.to(() => PaymentHistory());
    });
  }
}
