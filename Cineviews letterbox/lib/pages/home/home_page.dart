// lib/pages/home/home_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/movie.dart';
import '../read_book/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final String response = await rootBundle.loadString(
      'assets/jsons/movies.json',
    );

    final data = json.decode(response);

    setState(() {
      movies = (data as List).map((movie) => Movie.fromJson(movie)).toList();
    });
  }

  Widget buildMovieCard(Movie movie) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGEN
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(
                    movie: movie,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.poster,
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITULO + MENU
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      color: const Color(0xFF1E293B),
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        if (value == 'detail') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MovieDetailPage(
                                movie: movie,
                              ),
                            ),
                          );
                        }

                        if (value == 'comment') {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Ir a comentarios',
                              ),
                            ),
                          );
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'detail',
                          child: Row(
                            children: [
                              Icon(
                                Icons.movie,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Ver detalles',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'comment',
                          child: Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Comentar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // AÑO Y GENERO
                Text(
                  '${movie.year} • ${movie.genre}',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 6),

                // DURACION
                Text(
                  '${movie.duration} min',
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),

                const SizedBox(height: 10),

                // SINOPSIS
                Text(
                  movie.synopsis,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 12),

                // ESTRELLAS
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < movie.averageRating.round()
                          ? Colors.amber
                          : Colors.white24,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // DIRECTOR
                Text(
                  'Director: ${movie.director}',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 8),

                // ACTORES
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: movie.actors.map(
                    (actor) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Text(
                          actor,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),

                const SizedBox(height: 14),

                // TRAILER
                Row(
                  children: [
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.red,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(
                          movie.trailerUrl,
                        );

                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Text(
                        'Ver Trailer',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // COMENTARIOS
                const Text(
                  'Comentarios',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                ...(movie.reviews ?? []).map(
                  (review) {
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.user?.username ?? 'Usuario',
                            style: const TextStyle(
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: 16,
                                color: index < review.rating.round()
                                    ? Colors.amber
                                    : Colors.white24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            review.content,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'Cineviews',
      ),
      backgroundColor: const Color(0xFF111827),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: appBar(),
      body: movies.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return buildMovieCard(
                  movies[index],
                );
              },
            ),
    );
  }
}
