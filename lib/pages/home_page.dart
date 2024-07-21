import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_appbar.dart';
import 'package:food_delivery/components/custom_location_input.dart';
import 'package:food_delivery/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                CustomLocationInput()
              ],
            ),
            title: Text("Hi"),
          ),
        ],
        body: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
