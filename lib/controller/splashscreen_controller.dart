import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    logincheck();
  }

  logincheck() async {
    Future.delayed(const Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final savedtoken = prefs.getString('token');
    if (savedtoken != null && savedtoken.isNotEmpty) {
      Get.offAllNamed('/dashboard');
    } else {
      Get.offAllNamed('/login');
    }
  }
}
