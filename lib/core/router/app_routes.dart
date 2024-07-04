import 'package:dgmx_app/app/home/home_page.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  AppRoutes();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<HomePage>(
      name: HomePage.route,
      page: () => HomePage())
  ];
}