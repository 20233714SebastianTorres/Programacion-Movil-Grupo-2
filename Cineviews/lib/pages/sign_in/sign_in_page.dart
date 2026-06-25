// lib/pages/sign_in/sign_in_page.dart

import 'package:biblioul/components/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF8B5CF6),
        ),
        filled: true,
        fillColor: const Color(0xFF1E293B),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF8B5CF6),
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.25),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'INGRESA ESTA INFORMACIÓN',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 28),
          _inputField(
            controller: control.username,
            hint: 'Usuario',
            icon: Icons.person,
          ),
          const SizedBox(height: 18),
          _inputField(
            controller: control.password,
            hint: 'Contraseña',
            icon: Icons.lock,
            obscure: true,
          ),
          Obx(
            () => Column(
              children: [
                SizedBox(
                  height: control.message.value == '' ? 0 : 12,
                ),
                Text(
                  control.message.value,
                  style: TextStyle(
                    color: control.messageColor.value,
                  ),
                ),
                SizedBox(
                  height: control.message.value == '' ? 0 : 12,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                control.login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C3AED),
                foregroundColor: Colors.white,
                elevation: 15,
                shadowColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  control.goToSignUp(context);
                },
                child: const Text(
                  'Creala aquí',
                  style: TextStyle(
                    color: Color(0xFF8B5CF6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recoverPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            control.goToRecoverPassword(
              context,
            );
          },
          child: const Text(
            'Recuperala aquí',
            style: TextStyle(
              color: Color(0xFF8B5CF6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _background() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E1B4B),
            Color(0xFF0F172A),
            Color(0xFF020617),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _background(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const LoginHeader(),
                    const SizedBox(height: 25),
                    _form(context),
                    const SizedBox(height: 20),
                    _recoverPassword(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.context = context;

    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }
}
