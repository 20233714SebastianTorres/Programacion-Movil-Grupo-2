// lib/pages/sign_up/sign_up_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../configs/generic_response.dart';
import '../../models/user.dart';
import '../../services/session_service.dart';
import '../../services/user_services.dart';

class SignUpController extends GetxController {
	final TextEditingController username = TextEditingController();
	final TextEditingController email = TextEditingController();
	final TextEditingController password = TextEditingController();
	final TextEditingController confirmPassword = TextEditingController();

	final RxString message = ''.obs;
	final RxBool success = false.obs;
	final Rx<Color> messageColor = Colors.red.obs;

	final UserService userService = UserService();
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

	Future<void> signUp() async {
		final String usernameText = username.text.trim();
		final String emailText = email.text.trim();
		final String passwordText = password.text;
		final String confirmPasswordText = confirmPassword.text;

		if (usernameText.isEmpty ||
				emailText.isEmpty ||
				passwordText.isEmpty ||
				confirmPasswordText.isEmpty) {
			success.value = false;
			messageColor.value = Colors.orange;
			message.value = 'Completa usuario, correo y contraseña';
			_cleanMessage();
			return;
		}

		if (!emailText.contains('@') || !emailText.contains('.')) {
			success.value = false;
			messageColor.value = Colors.orange;
			message.value = 'Ingresa un correo válido';
			_cleanMessage();
			return;
		}

		if (passwordText.length < 6) {
			success.value = false;
			messageColor.value = Colors.orange;
			message.value = 'La contraseña debe tener al menos 6 caracteres';
			_cleanMessage();
			return;
		}

		if (passwordText != confirmPasswordText) {
			success.value = false;
			messageColor.value = Colors.orange;
			message.value = 'Las contraseñas no coinciden';
			_cleanMessage();
			return;
		}

		final String firstNameText = usernameText;
		final String lastNameText = emailText.contains('@')
				? emailText.split('@').first
				: usernameText;

		final User user = User(
			id: 0,
			username: usernameText,
			password: passwordText,
			firstName: firstNameText,
			lastName: lastNameText,
			email: emailText,
			resetKey: null,
			status: true,
			activationKey: null,
			birthDate: null,
			profilePicture: null,
			sex: null,
			nationality: null,
		);

		final GenericResponse<User> response = await userService.register(user);

		success.value = response.success;

		if (response.success) {
			messageColor.value = Colors.green;
			message.value = response.message;

			if (response.data != null) {
				sessionService.setCurrentUser(response.data!);
			}

			username.clear();
			email.clear();
			password.clear();
			confirmPassword.clear();

			Future.delayed(
				const Duration(milliseconds: 1200),
				() {
					Get.offAllNamed('/movies');
				},
			);
		} else {
			messageColor.value = Colors.red;
			message.value = response.message;
			_cleanMessage();
		}
	}

	@override
	void onClose() {
		username.dispose();
		email.dispose();
		password.dispose();
		confirmPassword.dispose();
		super.onClose();
	}
}
