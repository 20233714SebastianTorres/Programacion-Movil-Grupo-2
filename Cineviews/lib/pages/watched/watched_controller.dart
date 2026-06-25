import 'package:get/get.dart';

import '../../services/watched_service.dart';

class WatchedController extends GetxController {
  final WatchedService watchedService =
      Get.isRegistered<WatchedService>()
          ? Get.find<WatchedService>()
          : Get.put(WatchedService());

  get watchedMovies => watchedService.watchedMovies;
}