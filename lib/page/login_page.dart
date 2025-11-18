import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_08/widget/custombutton.dart';
import 'package:pas_mobile_11pplg1_08/widget/customtext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      child: const Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 15),
                      child: Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Silakan login untuk melanjutkan',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomTextField(
                        hintText: "Username",
                        controller: controller.usernamecontroller,
                        prefixIcon: Icons.person,
                      ),
                    ),
                    // Password Field
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomTextField(
                        hintText: "Password",
                        controller: controller.passwordcontroller,
                        obscureText: true,
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: CustomButton(
                        text: "Login",
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        onPressed: controller.login,
                      ),
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
