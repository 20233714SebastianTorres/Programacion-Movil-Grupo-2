import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_fav_controller.dart';

class ListFavPage extends StatelessWidget {
  final ListFavController control = Get.put(ListFavController());

  ListFavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        title: const Text("Lista de Favoritos"),
        backgroundColor: const Color(0xFF111827),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final favs = control.favorites;

              if (favs.isEmpty) {
                return const Center(
                  child: Text(
                    'No hay favoritos aún',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favs.length,
                itemBuilder: (context, index) {
                  final m = favs[index];
                  return ListTile(
                    leading: Icon(Icons.movie, color: Colors.purpleAccent),
                    title: Text(m.title, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(m.genre, style: const TextStyle(color: Colors.white54)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white70),
                      onPressed: () {
                        control.remove(m);
                      },
                    ),
                  );
                },
              );
            }),
          ),

          // BOTÓN ABAJO
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C3AED),
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  control.goToMovies(context);
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Volver a Películas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
