import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/movie.dart';
import '../../models/review.dart';
import '../../services/comment_service.dart';

class MovieDetailController extends GetxController {
  final CommentService commentService = Get.isRegistered<CommentService>()
      ? Get.find<CommentService>()
      : Get.put(CommentService());

  final RxDouble userRating = 0.0.obs;
  final TextEditingController commentController = TextEditingController();
  final RxList<Review> localReviews = <Review>[].obs;

  late Movie movie;

  void init(Movie movie) {
    this.movie = movie;
    if (localReviews.isEmpty) {
      localReviews.assignAll(movie.reviews ?? []);
    }
  }

  Future<void> openTrailer() async {
    final Uri url = Uri.parse(movie.trailerUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  void setRating(double rating) {
    userRating.value = rating;
  }

  void publishComment(BuildContext context) {
    final String content = commentController.text.trim();

    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un comentario')),
      );
      return;
    }

    if (userRating.value <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una calificación')),
      );
      return;
    }

    final Review newReview = Review(
      id: commentService.nextId(),
      content: content,
      rating: userRating.value,
      userId: 0,
      movieId: movie.id,
      user: null,
      movie: null,
    );

    commentService.addReview(newReview);
    localReviews.add(newReview);
    userRating.value = 0;
    commentController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Comentario publicado')),
    );
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}
