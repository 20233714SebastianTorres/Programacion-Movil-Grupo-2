import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'coments_controller.dart';

class ComentsPage extends StatelessWidget {
  final ComentsController control = Get.put(ComentsController());

  ComentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        title: const Text("Comentarios"),
        backgroundColor: const Color(0xFF111827),
      ),
      body: Obx(() {
        final comments = control.comments;

        if (comments.isEmpty) {
          return const Center(
            child: Text(
              'No hay comentarios aún',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final r = comments[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Text(
                  r.user?.username.substring(0, 1).toUpperCase() ?? 'U',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                r.user?.username ?? 'Usuario',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                r.content,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                r.rating.toString(),
                style: const TextStyle(color: Colors.white60),
              ),
            );
          },
        );
      }),
    );
  }
}
