import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/pages/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah Anda yakin ingin keluar?",
      textCancel: "Batal",
      textConfirm: "Logout",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back();
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        Get.offAllNamed(AppRoutes.splashscreen);
      },
    );
  }
}
