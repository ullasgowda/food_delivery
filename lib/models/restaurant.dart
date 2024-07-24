import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // final String name;
  // final String address;
  final List<Food> _menu = [
    Food(
        name: "Classic Burger",
        description: "A juicy patty with melted cheddar",
        imagePath: "lib/assets/burgers/burger.jpg",
        price: 40.55,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 4.00),
          Addon(name: "Diet Coke", price: 20.00),
          Addon(name: "Fries", price: 15.00)
        ]),
    Food(
        name: "Fruit Salad",
        description: "Variety of exotic fruits with wild honey",
        imagePath: "lib/assets/salads/fruit.jpg",
        price: 35.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Honey", price: 2.00),
        ]),
    Food(
        name: "Wild Veggie Pizza",
        description:
            "Hand tossed, thin crust with exotic fruits and vegetables",
        imagePath: "lib/assets/pizza/pizza1.jpg",
        price: 99.99,
        category: FoodCategory.pizza,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 2.00),
          Addon(name: "Diet Coke", price: 14.00)
        ]),
    Food(
        name: "Shake and Stir",
        description: "A mocktail of fruits and gin tonic, with fresh lime",
        imagePath: "lib/assets/drinks/drinks1.jpg",
        price: 29.99,
        category: FoodCategory.drinks,
        availableAddons: []),
    Food(
        name: "Cheesy Fries",
        description:
            "Freshly cooked fries with italian cheese, with a hint of melted cheddar",
        imagePath: "lib/assets/sides/fries.jpg",
        price: 19.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 2.00),
        ]),
  ];

  List<Food> get menu => _menu;
  List<Cart> get cart => _cart;

  // user cart

  final List<Cart> _cart = [];

// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    Cart? cart = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cart != null) {
      cart.quantity++;
    } else {
      _cart.add(Cart(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }
// remove

  void removeFromCart(Cart cart) {
    int cartIndex = _cart.indexOf(cart);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (Cart cart in _cart) {
      double itemTotal = cart.food.price;
      for (Addon addon in cart.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cart.quantity;
    }
    return total;
  }

// number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (Cart cart in _cart) {
      totalItemCount += cart.quantity;
    }
    return totalItemCount;
  }
//clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
// generate receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();

    receipt.writeln("---------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            "   Add ons --- ${_formatAddons(cartItem.selectedAddons)}");
      }

      receipt.writeln();
    }
    receipt.writeln("---------------");
    receipt.writeln();

    receipt.writeln("Total Items ${getTotalItemCount()}");
    receipt.writeln("Total Price ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

// format value to money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

// format addons to string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
