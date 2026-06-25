import 'package:get/get.dart';

import '../models/movie.dart';
import '../models/watched_movie.dart';

class WatchedService extends GetxService {
  static WatchedService get to => Get.find();

  final RxList<WatchedMovie> watchedMovies =
      <WatchedMovie>[].obs;

  bool isWatched(Movie movie) {
    return watchedMovies.any(
      (w) => w.movie.id == movie.id,
    );
  }

  void add(Movie movie) {
    if (!isWatched(movie)) {
      watchedMovies.add(
        WatchedMovie(
          movie: movie,
          watchedDate: DateTime.now(),
        ),
      );
    }
  }

  void remove(Movie movie) {
    watchedMovies.removeWhere(
      (w) => w.movie.id == movie.id,
    );
  }

  void toggle(Movie movie) {
    if (isWatched(movie)) {
      remove(movie);
    } else {
      add(movie);
    }
  }
}