import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/helper/db_helper.dart';
import 'package:pas_mobile_11pplg1_08/model/store_model.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  loadCart() async {
    cartItems.value = await CartDB.getCart();
  }

  addItem(Store item) async {
    await CartDB.addToCart(item);
    loadCart();
  }

  deleteItem(int id) async {
    await CartDB.removeItem(id);
    loadCart();
  }
}
