import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import '../../services/session_service.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController =
      TextEditingController(text: 'Usuario');
  final TextEditingController emailController =
      TextEditingController(text: 'usuario@email.com');
  final TextEditingController bioController = TextEditingController();

  final RxBool editing = false.obs;
  final SessionService sessionService = Get.isRegistered<SessionService>()
      ? Get.find<SessionService>()
      : Get.put(SessionService());

  void loadFromSession() {
    final User? user = sessionService.currentUser.value;
    if (user == null) return;

    final String fullName = '${user.firstName} ${user.lastName}'.trim();
    nameController.text = fullName.isEmpty ? user.username : fullName;
    emailController.text = user.email;
  }

  void toggleEditing() {
    final bool willSave = editing.value;
    editing.value = !editing.value;

    if (willSave) {
      final String typedName = nameController.text.trim();
      final List<String> parts = typedName.split(' ');
      final String firstName = parts.isEmpty ? '' : parts.first;
      final String lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      sessionService.updateCurrentUser(
        firstName: firstName,
        lastName: lastName,
        email: emailController.text.trim(),
      );
      loadFromSession();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadFromSession();
    ever<User?>(sessionService.currentUser, (_) {
      loadFromSession();
    });
  }

  void goToList(BuildContext context) {
    Navigator.pushNamed(context, '/list');
  }

  void goToComments(BuildContext context) {
    Navigator.pushNamed(context, '/coments');
  }

  void goToMovies(BuildContext context) {
    Navigator.pushNamed(context, '/movies');
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
