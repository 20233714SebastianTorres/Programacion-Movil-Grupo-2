// lib/pages/sign_in/sign_in_controller.dart
// lib/pages/sign_in/sign_in_controller.dart

import 'package:biblioul/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/generic_response.dart';
import '../../models/user.dart';
import '../../services/session_service.dart';
import '../home/home_page.dart';

class SignInController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxString message = ''.obs;
  RxBool success = false.obs;

  BuildContext? context;

  Rx<Color> messageColor = Colors.red.obs;

  UserService userService = UserService();
  final SessionService sessionService = Get.isRegistered<SessionService>()
      ? Get.find<SessionService>()
      : Get.put(SessionService());

  void _cleanMessage() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        message.value = '';
      },
    );
  }

  void login() async {
    print('hola estoy en login');

    print(username.text);
    print(password.text);

    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      User user = User.login(
        username: username.text,
        password: password.text,
      );

      GenericResponse response = await userService.login(user);

      print('Usuario logueado:');
      print(response.data);

      if (response.success) {
        success.value = true;

        if (response.data is User) {
          sessionService.setCurrentUser(response.data as User);
        }

        messageColor.value = Colors.green;
        message.value = response.message;

        // NAVEGAR A HOME
        Get.offAll(
          () => const HomePage(),
        );
      } else {
        success.value = false;

        messageColor.value = Colors.red;
        message.value = response.message;
      }
    } else {
      success.value = false;

      messageColor.value = Colors.orange;
      message.value = 'Debe ingresar usuario y contraseña';
    }

    _cleanMessage();
  }

  void goToSignUp(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/sign-up',
    );
  }

  void goToRecoverPassword(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/recover-password',
    );
  }
}
