import 'package:flutter/material.dart';

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

// add to cart

// remove

// get total price of cart

// number of items in cart

//clear cart

// generate receipt

// format value to money

// format addons to string summary
}
