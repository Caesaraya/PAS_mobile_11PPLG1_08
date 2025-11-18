import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/register_controller.dart';
import 'package:pas_mobile_11pplg1_08/widget/custombutton.dart';
import 'package:pas_mobile_11pplg1_08/widget/customtext.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      child: const Icon(
                        Icons.person_add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Buat Akun Baru',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Silakan lengkapi data di bawah',
                      style: TextStyle(color: Colors.black38),
                    ),
                    const SizedBox(height: 20),

                    // Username
                    CustomTextField(
                      hintText: "Username",
                      controller: controller.usernameController,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 15),

                    // Password
                    CustomTextField(
                      hintText: "Password",
                      controller: controller.passwordController,
                      obscureText: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 15),

                    // Full Name
                    CustomTextField(
                      hintText: "Full Name",
                      controller: controller.fullNameController,
                      prefixIcon: Icons.badge,
                    ),
                    const SizedBox(height: 15),

                    // Email
                    CustomTextField(
                      hintText: "Email",
                      controller: controller.emailController,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 25),

                    // Register Button
                    CustomButton(
                      text: "Register",
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      onPressed: controller.register,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
