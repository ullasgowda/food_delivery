import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_quantity_selector.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class CustomCartTile extends StatelessWidget {
  final Cart cartItem;

  const CustomCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 50,
                        width: 100,
                      ),
                    ),

                    // name and price

                    Column(
                      children: [
                        Text(
                          cartItem.food.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          "INR ${cartItem.food.price}",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),

                    // counter

                    CustomQuantitySelector(
                      food: cartItem.food,
                      quantity: cartItem.quantity,
                      onIncrement: () {
                        restaurant.addToCart(
                            cartItem.food, cartItem.selectedAddons);
                      },
                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      },
                    )
                  ],
                ),
              ),

              //addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Row(
                              children: [
                                Text(
                                  addon.name,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "INR ${addon.price}",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            onSelected: (value) {},
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
