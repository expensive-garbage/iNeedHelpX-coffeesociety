class StripePaymentsModel {
  static const ID = "id";
  static const PAYMENT_ID = "paymentId";
  static const CART = "cart";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String? id;
  String? paymentId;
  String? amount;
  String? status;
  int? createdAt;
  List? cart;

  StripePaymentsModel(
      {this.id,
      this.paymentId,
      this.amount,
      this.status,
      this.createdAt,
      this.cart});

  StripePaymentsModel.fromMap(Map data) {
    id = data[ID];
    createdAt = data[CREATED_AT] as int?;
    paymentId = data[PAYMENT_ID];
    amount = data[AMOUNT];
    status = data[STATUS];
    cart = data[CART];
  }
}
