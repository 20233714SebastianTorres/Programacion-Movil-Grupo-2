import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'watched_controller.dart';

class WatchedPage extends StatelessWidget {
  final WatchedController control =
      Get.put(WatchedController());

  WatchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        title: const Text("Películas vistas"),
      ),
      body: Obx(() {
        final movies = control.watchedMovies;

        if (movies.isEmpty) {
          return const Center(
            child: Text(
              "No hay películas vistas",
            ),
          );
        }

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final item = movies[index];

            return ListTile(
              title: Text(item.movie.title),
              subtitle: Text(
                item.watchedDate.toString(),
              ),
            );
          },
        );
      }),
    );
  }
}