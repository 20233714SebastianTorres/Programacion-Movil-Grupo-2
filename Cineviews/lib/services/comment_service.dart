import 'package:get/get.dart';

import '../models/review.dart';

class CommentService extends GetxService {
  static CommentService get to => Get.find();

  final RxList<Review> _reviews = <Review>[].obs;

  RxList<Review> get reviews => _reviews;

  List<Review> getAll() => _reviews;

  List<Review> getByMovie(int movieId) {
    return _reviews.where((r) => r.movieId == movieId).toList();
  }

  void addReview(Review review) {
    _reviews.add(review);
  }

  int nextId() {
    if (_reviews.isEmpty) return 1;
    return _reviews.map((r) => r.id).reduce((a, b) => a > b ? a : b) + 1;
  }
}
