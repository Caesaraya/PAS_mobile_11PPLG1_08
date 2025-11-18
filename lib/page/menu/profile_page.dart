import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/profile_controller.dart';
import 'package:pas_mobile_11pplg1_08/widget/custombutton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.black,
              backgroundImage: const AssetImage("assets/tar.jpg"),
            ),

            SizedBox(height: 20),
            Text(
              "Caesaraya Junior Nurgoho",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Caesaraya@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Logout",
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
