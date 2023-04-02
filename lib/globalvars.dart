import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeesociety/config/config.dart';
import 'package:coffeesociety/controllers/cart_controller.dart';
import 'package:coffeesociety/controllers/cupinfo_controller.dart';
import 'package:coffeesociety/controllers/rapyd_payment.dart';
import 'package:coffeesociety/controllers/stripe_paycontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffeesociety/controllers/login_controller.dart';
import 'package:logger/logger.dart';
import 'package:rapyd/rapyd.dart';

// var scaffoldKey = GlobalKey<ScaffoldState>();
//firebase stuff
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

//controllers in use
LoginController loginController = LoginController.instance;
CartController cartController = CartController.instance;
CupInfoController cupController = CupInfoController.instance;
RapydPayments rapydPaymentsController = RapydPayments.instance;
StripePaymentsController stripePaymentsController =
    StripePaymentsController.instance;
// LocationController locationController = LocationController.instance;

//other variables
var rapydConfig = Configurations();
var rapydClient = RapydClient(rapydConfig.rapydAccess, rapydConfig.rapydSecret);

//allows for logging to the console
Logger logger = Logger();
