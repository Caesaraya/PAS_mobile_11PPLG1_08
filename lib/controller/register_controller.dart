import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/API/networkclient.dart';
import 'package:pas_mobile_11pplg1_08/pages/routes.dart';

class RegisterController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register() async {
    isLoading.value = true;
    try {
      final response =
          await ClientNetwork.postRequest('latihan/register-user', {
            'username': usernamecontroller.text.trim(),
            'password': passwordcontroller.text.trim(),
            'fullname': fullnamecontroller.text.trim(),
            'email': emailcontroller.text.trim(),
          });

      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['status'] == true) {
        Get.snackbar('Registrasi Berhasil', 'Silakan login dengan akun Anda');
        Get.back();
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar('Registrasi Gagal', 'Coba lagi nanti');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
