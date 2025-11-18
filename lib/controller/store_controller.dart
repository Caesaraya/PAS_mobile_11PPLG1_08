import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/model/store_model.dart';
import 'package:http/http.dart' as http;

class StoreController extends GetxController {
  var isLoading = false.obs;

  var items = <Store>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStores();
  }

  fetchStores() async {
    const url = "https://fakestoreapi.com/products";

    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(url));
      print("status code: ${response.statusCode}");
      print("json result: ${response.body}");

      if (response.statusCode == 200) {
        final data = storeFromJson(response.body);

        items.assignAll(data);
      } else {
        Get.snackbar("Failed", "Failed to load store data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    isLoading.value = false;
  }
}
