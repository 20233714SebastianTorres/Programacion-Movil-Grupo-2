import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController control = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        title: const Text("Perfil"),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Obx(() => IconButton(
                icon: Icon(control.editing.value ? Icons.check : Icons.edit),
                onPressed: control.toggleEditing,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // NOMBRE
            Obx(() => TextField(
                  controller: control.nameController,
                  enabled: control.editing.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    labelStyle: TextStyle(color: Colors.white70),
                  ),
                )),

            const SizedBox(height: 10),

            // EMAIL
            Obx(() => TextField(
                  controller: control.emailController,
                  enabled: control.editing.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Correo",
                    labelStyle: TextStyle(color: Colors.white70),
                  ),
                )),

            const SizedBox(height: 20),

            // CUADRO DE DESCRIPCIÓN
            Obx(() => TextField(
                  controller: control.bioController,
                  maxLines: 3,
                  maxLength: 200,
                  enabled: control.editing.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Descripción",
                    labelStyle: const TextStyle(color: Colors.white70),
                    hintText: "Escribe algo sobre ti...",
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: const Color(0xFF111827),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )),

            const SizedBox(height: 25),

            // BOTÓN LISTA
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C3AED),
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  control.goToList(context);
                },
                child: const Text(
                  "Ir a Lista",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // BOTÓN COMENTARIOS
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  control.goToComments(context);
                },
                child: const Text(
                  "Ir a Comentarios",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const Spacer(),

            // BOTÓN PELÍCULAS
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  control.goToMovies(context);
                },
                child: const Text(
                  "Ir a Películas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
