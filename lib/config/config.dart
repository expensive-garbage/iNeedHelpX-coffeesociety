//for rapyd and stripe payments. Stripe will be added later!
//rapyd api config to make calling ther keys abstracted for security purposes. Generally this file should not be checked into git but the the purposes of this Rapyd hackathon it will be so that the judges can better understand my procceses. I already have a variable set in globalvars file
//access goes like this:
//configurations.apiKey, rapydConfig.apiKey

class Configurations {
  //api key set for rapyd and stripe
  static const _rapydSecret =
      "7f14bbfd8595c0f735f14a38446451227c2b69676d9cabf90f6532c536b5a5ace7a9715111afc323";
  static const _rapydAccess = "79B53038AA5F0E6789F8";
  static const _squareAccessToken =
      "EAAAEMgJFNjHfIGRx0nHEu7jNdpCf01CEO5FgSfWyiDKSGG9lBvyiMcMXaHAIJHf";
  static const _squareApplicationID = "sandbox-sq0idb-6XjGuCN0eZ4szpS4fllhIw";

  //for stripe payments live keys
  static const _stripePublishableKey =
      "pk_live_PTyXJkdSTgqmeYsOR6HO1PZM00bTjgWf5o";

  //change this later
  static const _stripeFuncUrl =
      "https://us-east1-getxshop-dce91.cloudfunctions.net/stripePaymentIntentRequest";

  //for stripe payments test keys
  static const _stripePublishableKeyTest =
      "pk_test_kwpcqJentGSyN2JCykMQKMIS00T1dg3lrF";

//Make some getter functions
//for stripe payments live keys
  String get stripePublishableKey => _stripePublishableKey;
  String get stripeFuncUrl => _stripeFuncUrl;

  //for stripe payments test keys
  String get stripePublishableKeyTest => _stripePublishableKeyTest;

  String get rapydSecret => _rapydSecret;
  String get rapydAccess => _rapydAccess;
  String get squareAccessToken => _squareAccessToken;
  String get squareApplicationID => _squareApplicationID;
}
