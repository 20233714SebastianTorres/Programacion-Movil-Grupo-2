// lib/serices/user_service.dart

import 'dart:convert';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';

class UserService {
  static List<User>? _cachedUsers;

  Future<List<User>> _loadUsers() async {
    if (_cachedUsers != null) {
      return _cachedUsers!;
    }

    String jsonString = await rootBundle.loadString('assets/jsons/users.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    _cachedUsers = jsonList.map((json) => User.fromJson(json)).toList();
    return _cachedUsers!;
  }

  Future<GenericResponse> login(User user) async {
    try {
      final List<User> users = await _loadUsers();

      // buscar el usario que coincide con el usuario del formulario
      for (User u in users) {
        if (user.username == u.username && user.password == u.password) {
          return GenericResponse(
              success: true, data: u, message: 'Login exitoso', error: null);
        }
      }
      // si sale del for, es que no encontró al usuario
      return GenericResponse(
          success: false,
          data: null,
          message: 'Usuario y/o contraseña no válidos',
          error: null);
    } catch (e, stackTrace) {
      print('Error: $e'); // 'Error ' + e;
      print('Stack Trace: $stackTrace');
      return GenericResponse(
          success: false,
          data: null,
          message: 'Ocurrió un error no esperado en el login',
          error: stackTrace.toString());
    }
  }

  Future<GenericResponse<User>> register(User user) async {
    try {
      final List<User> users = await _loadUsers();

      final bool usernameExists = users.any(
        (existingUser) =>
            existingUser.username.toLowerCase() == user.username.toLowerCase(),
      );

      if (usernameExists) {
        return GenericResponse<User>(
          success: false,
          data: null,
          message: 'El usuario ya existe',
          error: null,
        );
      }

      final bool emailExists = users.any(
        (existingUser) =>
            existingUser.email.toLowerCase() == user.email.toLowerCase(),
      );

      if (emailExists) {
        return GenericResponse<User>(
          success: false,
          data: null,
          message: 'El correo ya está registrado',
          error: null,
        );
      }

      final int nextId = users.isEmpty
          ? 1
          : users
                  .map((existingUser) => existingUser.id)
                  .reduce((a, b) => a > b ? a : b) +
              1;

      final User newUser = User(
        id: nextId,
        username: user.username,
        password: user.password,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        resetKey: null,
        status: true,
        activationKey: 'ACT$nextId',
        birthDate: null,
        profilePicture: null,
        sex: null,
        nationality: null,
      );

      users.add(newUser);

      return GenericResponse<User>(
        success: true,
        data: newUser,
        message: 'Cuenta creada correctamente',
        error: null,
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
