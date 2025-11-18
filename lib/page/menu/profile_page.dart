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
          children: [
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
