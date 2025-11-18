import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/favorit_product_list.dart';
import 'package:pas_mobile_11pplg1_08/controller/profile_controller.dart';
import '../controller/nav_controller.dart';
import '../controller/store_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
