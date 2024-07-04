import 'package:dgmx_app/app/home/home_page.dart';
import 'package:dgmx_app/app_initializer.dart';
import 'package:dgmx_app/core/configs/global_vars.dart';
import 'package:dgmx_app/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

void main() {
  AppInitializer.initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      DeviceType deviceType) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: GlobalVars.appName,
            initialRoute: HomePage.route,
            getPages: AppRoutes.pages,
          ));
      });
  }
}