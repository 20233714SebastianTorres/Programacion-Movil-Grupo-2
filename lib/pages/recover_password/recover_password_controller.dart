import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final RxString message = ''.obs;
  final Rx<Color> messageColor = Colors.red.obs;

  void sendRecovery() {
    final String email = emailController.text.trim();

    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      messageColor.value = Colors.orange;
      message.value = 'Ingresa un correo válido';
      return;
    }

    messageColor.value = Colors.green;
    message.value = 'Se envió el correo de recuperación';
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
