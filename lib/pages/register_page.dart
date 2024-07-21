import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/components/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's create your Account!",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),
          CustomTextField(
              controller: nameController,
              hintText: "Full Name",
              obscureText: false),
          const SizedBox(height: 10),
          CustomTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false),
          const SizedBox(height: 10),
          CustomTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true),
          const SizedBox(height: 10),
          CustomTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: false),
          const SizedBox(height: 15),
          CustomButton(text: "Sign Up", onTap: () => {}),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
