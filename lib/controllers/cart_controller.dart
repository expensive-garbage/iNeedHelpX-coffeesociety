import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeesociety/globalvars.dart';
import 'package:coffeesociety/models/cart_model.dart';
import 'package:coffeesociety/models/cup_model.dart';
import 'package:coffeesociety/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();

  Rx<CartItemModel> cartItemModel = CartItemModel().obs;
  Rx<double> totalCartPrice = 0.0.obs;
  int quantity = 1;
  Rx<int> changeQuantity = 1.obs;

  @override
  void onReady() {
    super.onReady();
    ever(loginController.userModel, changeCartTotalPrice);
    ever(cartController.cartItemModel, decreaseQuantity);
    ever(cartController.cartItemModel, increaseQuantity);
  }

  double? getCost(CartItemModel item) {
    double cost = 1;
    cost = item.cost! * item.quantity!;
    return cost;
  }

//should be productmodel
  void addProductToCart(CupModel2 product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = Uuid().v1();
        loginController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price!,
              "picture": product.picture,
              "cost": product.price!
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      loginController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.toString());
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      loginController.userModel.value.cart!.forEach((cartItem) {
        int? cartq = cartItem.quantity ?? 1;
        totalCartPrice += cartItem.cost! * cartq;
      });
    }
  }

  bool _isItemAlreadyAdded(CupModel2 product) =>
      loginController.userModel.value.cart!
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      // print("before decrese ${item.quantity}");
      quantity = item.quantity!;
      quantity--;
      item.quantity = quantity;

      // print("After decrese ${item.quantity!}");
      loginController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    removeCartItem(item);
    // print("before increse ${item.quantity}");
    quantity = item.quantity!;
    quantity++;
    item.quantity = quantity;
    // print("After increase ${item.quantity!}");
    // logger.i({"quantity": item.quantity});
    loginController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
