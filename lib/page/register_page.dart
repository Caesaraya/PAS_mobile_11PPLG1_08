import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                        'Silakan register untuk melanjutkan',
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
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomTextField(
                        hintText: "Full Name",
                        controller: controller.fullnamecontroller,
                        prefixIcon: Icons.people,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomTextField(
                        hintText: "example@gmail.com",
                        controller: controller.emailcontroller,
                        prefixIcon: Icons.mail,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: CustomButton(
                        text: "Register",
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        onPressed: controller.register,
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
