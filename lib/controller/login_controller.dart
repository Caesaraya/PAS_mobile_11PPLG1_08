import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/API/networkclient.dart';
import 'package:pas_mobile_11pplg1_08/pages/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg1_08/model/login_model.dart';

class LoginController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void register() {
    Get.toNamed(AppRoutes.register);
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await ClientNetwork.postRequest('latihan/login', {
        'username': usernamecontroller.text.trim(),
        'password': passwordcontroller.text.trim(),
      });

      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['status'] == true) {
        final loginData = LoginModel.fromJson(data);
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', loginData.token);
        await prefs.setString('username', usernamecontroller.text.trim());
        await prefs.setBool('isGoogleLogin', false);

        print("[DEBUG] Data API disimpan ke SharedPref: ${prefs.getKeys()}");

        Get.offAllNamed(AppRoutes.splashscreen);
      } else {
        Get.snackbar(
          'Login gagal',
          data['message'] ?? 'Username/password salah',
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
