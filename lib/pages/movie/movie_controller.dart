// lib/pages/home/home_controller.dart

import 'package:get/get.dart';

import '../../models/movie.dart';
import '../../services/movie_service.dart';

class HomeController extends GetxController {
  final MovieService _movieService = MovieService();

  RxList<Movie> movies = <Movie>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;

    final response = await _movieService.fetchAll();

    if (response.success) {
      movies.value = response.data as List<Movie>;
    }

    isLoading.value = false;
  }
}
