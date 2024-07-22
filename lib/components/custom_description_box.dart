import 'package:flutter/material.dart';

class CustomDescriptionBox extends StatelessWidget {
  const CustomDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var secondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    var primaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // fee
          Column(
            children: [
              Text("INR 400", style: primaryTextStyle),
              Text(
                "Delivery Fee",
                style: secondaryTextStyle,
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "20 to 25 min",
                style: primaryTextStyle,
              ),
              Text(
                "Delivery Time",
                style: secondaryTextStyle,
              )
            ],
          )

          //time
        ],
      ),
    );
  }
}
