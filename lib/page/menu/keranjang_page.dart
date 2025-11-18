import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/favorit_product_list.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartC = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Obx(() {
        if (cartC.cartItems.isEmpty) {
          return const Center(
            child: Text(
              "Keranjang masih kosong",
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: cartC.cartItems.length,
          itemBuilder: (_, i) {
            var item = cartC.cartItems[i];

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // TEXT AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "\$${item['price']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // DELETE BUTTON
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cartC.deleteItem(item['id']);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
