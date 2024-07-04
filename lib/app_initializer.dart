import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppInitializer {
  AppInitializer();

  static Future<void> asyncConfigs() async {
    await GetStorage.init();
  }

  static void initServices() {
    Get.lazyPut(() => GetStorage(), fenix: true);

    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.org'
        ),
      ),
      tag: 'main_api',
      fenix: true,
    );
  }
}