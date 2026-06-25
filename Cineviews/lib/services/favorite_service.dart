import 'package:get/get.dart';

import '../models/movie.dart';

class FavoriteService extends GetxService {
  static FavoriteService get to => Get.find();

  final RxList<Movie> favorites = <Movie>[].obs;

  List<Movie> getAll() => favorites;

  bool isFavorite(Movie movie) {
    return favorites.any((m) => m.id == movie.id);
  }

  void add(Movie movie) {
    if (!isFavorite(movie)) {
      favorites.add(movie);
    }
  }

  void remove(Movie movie) {
    favorites.removeWhere((m) => m.id == movie.id);
  }

  void toggle(Movie movie) {
    if (isFavorite(movie)) {
      remove(movie);
    } else {
      add(movie);
    }
  }
}
