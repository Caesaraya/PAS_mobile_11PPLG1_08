import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_08/binding/login_binding.dart';
import 'package:pas_mobile_11pplg1_08/binding/nav_binding.dart';
import 'package:pas_mobile_11pplg1_08/page/dashboard_page.dart';
import 'package:pas_mobile_11pplg1_08/page/login_page.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/home_page.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/keranjang_page.dart';
import 'package:pas_mobile_11pplg1_08/page/menu/profile_page.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: NavBinding(),
      children: [
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(name: AppRoutes.keranjang, page: () => KeranjangPage()),
        GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
      ],
    ),
  ];
}
