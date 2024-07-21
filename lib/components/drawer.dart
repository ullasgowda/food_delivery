import 'package:flutter/material.dart';
import 'package:food_delivery/auth/auth.dart';
import 'package:food_delivery/components/custom_drawer_tile.dart';
import 'package:food_delivery/pages/login_page.dart';
import 'package:food_delivery/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_outline_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          CustomDrawerTile(
              title: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),
          CustomDrawerTile(
            title: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          const Spacer(),
          CustomDrawerTile(
              title: "L O G O U T",
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Auth(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
