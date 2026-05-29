// lib/pages/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/movie.dart';
import '../../models/review.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController control = Get.put(HomeController());

  Widget _movieCard(Movie movie) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7C3AED),
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.averageRating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _infoChip(
                  Icons.movie,
                  movie.genre,
                ),
                const SizedBox(width: 10),
                _infoChip(
                  Icons.schedule,
                  '${movie.duration} min',
                ),
                const SizedBox(width: 10),
                _infoChip(
                  Icons.calendar_month,
                  movie.year.toString(),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Text(
              'Sinopsis',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.synopsis,
              style: const TextStyle(
                color: Colors.white70,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Reseñas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            if (movie.reviews == null || movie.reviews!.isEmpty)
              const Text(
                'No hay reseñas',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ...movie.reviews!
                .map(
                  (review) => _reviewCard(review),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _reviewCard(Review review) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF7C3AED),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  review.user?.username ?? 'Usuario',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    review.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.content,
            style: const TextStyle(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(
    IconData icon,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF8B5CF6),
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Obx(() {
      if (control.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF8B5CF6),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: control.movies.length,
        itemBuilder: (context, index) {
          final movie = control.movies[index];

          return _movieCard(movie);
        },
      );
    });
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF111827),
      title: const Text(
        'Películas',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: _appBar(),
      body: _buildBody(),
    );
  }
}
