import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/movie.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  double userRating = 0;

  Future<void> openTrailer() async {
    final Uri url = Uri.parse(
      widget.movie.trailerUrl,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Widget buildStars() {
    return Row(
      children: List.generate(
        5,
        (index) => IconButton(
          onPressed: () {
            setState(() {
              userRating = index + 1;
            });
          },
          icon: Icon(
            Icons.star,
            color: index < userRating ? Colors.amber : Colors.white38,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  movie.poster,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${movie.year} • ${movie.genre}",
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Director: ${movie.director}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Actores:",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: movie.actors.map((actor) {
                return Chip(
                  label: Text(actor),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Descripción",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movie.synopsis,
              style: const TextStyle(
                color: Colors.white70,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Ver Trailer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: openTrailer,
                  icon: const Icon(
                    Icons.play_circle_fill,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Califica esta película",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            buildStars(),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Escribe un comentario...",
                hintStyle: const TextStyle(
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Publicar comentario",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
