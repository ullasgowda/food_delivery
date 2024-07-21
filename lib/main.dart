import 'package:flutter/material.dart';
import 'package:food_delivery/auth/auth.dart';
import 'package:food_delivery/pages/register_page.dart';
import 'package:food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const DeliveryApp(),
    ),
  );
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Auth(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
