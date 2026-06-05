import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/movie.dart';
import '../../services/favorite_service.dart';

class ListFavController extends GetxController {
  final FavoriteService favoriteService = Get.isRegistered<FavoriteService>()
      ? Get.find<FavoriteService>()
      : Get.put(FavoriteService());

  RxList<Movie> get favorites => favoriteService.favorites;

  void remove(Movie movie) {
    favoriteService.remove(movie);
  }

  void goToMovies(BuildContext context) {
    Navigator.pushNamed(context, '/movies');
  }
}
