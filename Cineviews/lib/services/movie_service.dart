// lib/services/movie_service.dart

import 'dart:convert';

import 'package:flutter/services.dart';

import '../configs/generic_response.dart';
import '../models/movie.dart';

class MovieService {
  Future<GenericResponse> fetchAll() async {
    try {
      // leer el json como string
      String jsonString = await rootBundle.loadString(
        'assets/jsons/movies.json',
      );

      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);

      // instanciar objetos a partir de json
      final List<Movie> movies = jsonList
          .map(
            (json) => Movie.fromJson(json),
          )
          .toList();

      return GenericResponse(
        success: true,
        data: movies,
        message: 'Películas obtenidas correctamente',
        error: null,
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');

      return GenericResponse(
        success: false,
        data: null,
        message: 'Ocurrió un error al obtener películas',
        error: stackTrace.toString(),
      );
    }
  }

  Future<GenericResponse> searchByGenre(
    String genre,
  ) async {
    try {
      // leer el json como string
      String jsonString = await rootBundle.loadString(
        'assets/jsons/movies.json',
      );

      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);

      // instanciar objetos a partir de json
      final List<Movie> movies = jsonList
          .map(
            (json) => Movie.fromJson(json),
          )
          .toList();

      // filtrar peliculas por genero
      final List<Movie> filteredMovies = movies.where((movie) {
        return movie.genre.toLowerCase().contains(
              genre.toLowerCase(),
            );
      }).toList();

      return GenericResponse(
        success: true,
        data: filteredMovies,
        message: 'Películas filtradas correctamente',
        error: null,
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');

      return GenericResponse(
        success: false,
        data: null,
        message: 'Ocurrió un error al buscar películas',
        error: stackTrace.toString(),
      );
    }
  }

  Future<GenericResponse> searchByTitle(
    String title,
  ) async {
    try {
      // leer el json como string
      String jsonString = await rootBundle.loadString(
        'assets/jsons/movies.json',
      );

      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);

      // instanciar objetos a partir de json
      final List<Movie> movies = jsonList
          .map(
            (json) => Movie.fromJson(json),
          )
          .toList();

      // filtrar peliculas por titulo
      final List<Movie> filteredMovies = movies.where((movie) {
        return movie.title.toLowerCase().contains(
              title.toLowerCase(),
            );
      }).toList();

      return GenericResponse(
        success: true,
        data: filteredMovies,
        message: 'Películas encontradas correctamente',
        error: null,
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');

      return GenericResponse(
        success: false,
        data: null,
        message: 'Ocurrió un error al buscar películas',
        error: stackTrace.toString(),
      );
    }
  }
}
