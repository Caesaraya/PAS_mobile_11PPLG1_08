import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/controller/nav_controller.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/home_page.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/keranjang_page.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<BottomNavController>();
    final pages = [HomePage(), KeranjangPage(), ProfilePage()];
    final titles = ["Home", "Keranjang", "Profile"];
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            titles[navController.currentIndex.value],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: const Text(
                  "Caesaraya",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  "Zulzar@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.person_4_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: const Text("Home"),
                selected: navController.currentIndex.value == 0,
                selectedTileColor: Colors.grey.shade300,
                onTap: () {
                  navController.changeIndex(0);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.black,
                ),
                title: const Text("Keranjang"),
                selected: navController.currentIndex.value == 1,
                selectedTileColor: Colors.grey.shade300,
                onTap: () {
                  navController.changeIndex(1);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text("Profile"),
                selected: navController.currentIndex.value == 2,
                selectedTileColor: Colors.grey.shade300,
                onTap: () {
                  navController.changeIndex(2);
                  Get.back();
                },
              ),
            ],
          ),
        ),
        body: pages[navController.currentIndex.value],
      ),
    );
  }
}
