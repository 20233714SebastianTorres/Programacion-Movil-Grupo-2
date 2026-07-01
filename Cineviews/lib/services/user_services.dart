// lib/services/user_services.dart

import 'dart:convert';
import 'package:biblioul/configs/generic_response.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService {
  static const String _baseUrl = 'http://10.0.2.2:5000/apis/v1/users';

  Future<GenericResponse<User>> login(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': user.username,
          'password': user.password,
        }),
      );

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && decoded['success'] == true) {
        final userData = decoded['data']['user'] as Map<String, dynamic>;
        return GenericResponse<User>(
          success: true,
          data: User.fromJson(userData),
          message: decoded['message'] ?? 'Login exitoso',
          error: null,
        );
      }

      return GenericResponse<User>(
        success: false,
        data: null,
        message: decoded['message'] ?? 'Usuario y/o contraseña no válidos',
        error: decoded['error'],
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      return GenericResponse<User>(
        success: false,
        data: null,
        message: 'Ocurrió un error no esperado en el login',
        error: stackTrace.toString(),
      );
    }
  }

  Future<GenericResponse<User>> register(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': user.username,
          'password': user.password,
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email,
        }),
      );

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && decoded['success'] == true) {
        final userData = decoded['data']['user'] as Map<String, dynamic>;
        return GenericResponse<User>(
          success: true,
          data: User.fromJson(userData),
          message: decoded['message'] ?? 'Cuenta creada correctamente',
          error: null,
        );
      }

      return GenericResponse<User>(
        success: false,
        data: null,
        message: decoded['message'] ?? 'No se pudo crear la cuenta',
        error: decoded['error'],
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      return GenericResponse<User>(
        success: false,
        data: null,
        message: 'Ocurrió un error no esperado al registrar',
        error: stackTrace.toString(),
      );
    }
  }
}
