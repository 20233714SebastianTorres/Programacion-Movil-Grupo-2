// lib/pages/home/home_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/movie.dart';
import '../../services/favorite_service.dart';
import '../movie_detail/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];

  TextEditingController searchController = TextEditingController();

  String selectedGenre = 'Todos';

  List<String> genres = ['Todos'];

  @override
  void initState() {
    super.initState();
    loadMovies();
    // ensure FavoriteService is available
    if (!Get.isRegistered<FavoriteService>()) {
      Get.put(FavoriteService());
    }
  }

  Future<void> loadMovies() async {
    final String response =
        await rootBundle.loadString('assets/jsons/movies.json');

    final data = json.decode(response);

    movies = (data as List).map((movie) => Movie.fromJson(movie)).toList();

    filteredMovies = movies;

    final uniqueGenres = movies.map((movie) => movie.genre).toSet().toList();

    genres.addAll(uniqueGenres);

    setState(() {});
  }

  void filterMovies() {
    String query = searchController.text.toLowerCase();

    setState(() {
      filteredMovies = movies.where((movie) {
        final matchesSearch = movie.title.toLowerCase().contains(query);

        final matchesGenre =
            selectedGenre == 'Todos' ? true : movie.genre == selectedGenre;

        return matchesSearch && matchesGenre;
      }).toList();
    });
  }

  Widget searchAndFilter() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              controller: searchController,
              onChanged: (value) => filterMovies(),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar película...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF8B5CF6),
                ),
                filled: true,
                fillColor: const Color(0xFF111827),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(14),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedGenre,
                  isExpanded: true,
                  dropdownColor: const Color(0xFF111827),
                  style: const TextStyle(color: Colors.white),
                  items: genres.map((genre) {
                    return DropdownMenuItem(
                      value: genre,
                      child: Text(
                        genre,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGenre = value!;
                    });
                    filterMovies();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(movie: movie),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${movie.year} • ${movie.genre}',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 6),
                Text(
                  '${movie.duration} min',
                  style: const TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 10),
                Text(
                  movie.synopsis,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
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
                const SizedBox(width: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: Obx(() {
                    final favService = FavoriteService.to;
                    final isFav = favService.isFavorite(movie);
                    return IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.redAccent : Colors.white54,
                      ),
                      onPressed: () {
                        favService.toggle(movie);
                        final snack = isFav
                            ? 'Eliminada de favoritos'
                            : 'Añadida a favoritos';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(snack)),
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(height: 12),
                Text(
                  'Director: ${movie.director}',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 14),
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
                        final Uri url = Uri.parse(movie.trailerUrl);

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
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Cineviews'),
      backgroundColor: const Color(0xFF111827),

      // 👈 IZQUIERDA (login opcional)
      leading: IconButton(
        icon: const Icon(Icons.login),
        onPressed: () {
          Navigator.pushNamed(context, '/sign-in');
        },
      ),

      // 👉 DERECHA (PERFIL)
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: appBar(),
      body: Column(
        children: [
          searchAndFilter(),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron películas',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      return buildMovieCard(
                        filteredMovies[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
