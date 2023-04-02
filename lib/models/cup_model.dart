class CupModel {
  static const INFO = "info";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";

  String? info;
  String? image;
  String? name;

  String? price;

  CupModel({
    required this.info,
    this.image,
    this.name,
    this.price,
  });

  CupModel.fromMap(Map<String, dynamic> data) {
    info = data[INFO];
    image = data[IMAGE];
    name = data[NAME];
    price = data[PRICE];
  }
}

class CupModel2 {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const DESCRIPTION = "description";
  static const REVIEW = "review";
  static const DATE = "date";
  static const PRICE = "price";
  static const RATING = "rating";
  static const FEATURE = "feature";
  static const SALE = "sale";

  String? id;
  String? name;
  String? picture;
  String? description;
  String? review;
  DateTime? date;
  double? price;
  double? rating;
  bool? feature;
  bool? sale;

  CupModel2(
      {this.id,
      this.name,
      this.picture,
      this.description,
      this.review,
      this.date,
      this.price,
      this.rating,
      this.feature,
      this.sale});

  CupModel2.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAME];
    picture = data[PICTURE];
    description = data[DESCRIPTION];
    review = data[REVIEW];
    date = data[DATE].toDate();
    price = data[PRICE].toDouble();
    rating = data[RATING].toDouble();
    feature = data[FEATURE];
    sale = data[SALE];
  }
}
