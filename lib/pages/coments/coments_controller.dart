import 'package:get/get.dart';

import '../../services/comment_service.dart';

class ComentsController extends GetxController {
  final CommentService commentService = Get.isRegistered<CommentService>()
      ? Get.find<CommentService>()
      : Get.put(CommentService());

  RxList get comments => commentService.reviews;
}
