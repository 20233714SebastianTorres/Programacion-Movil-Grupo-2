import 'review.dart';

class Movie {
  final int id;
  final String title;
  final int year;
  final String synopsis;
  final String genre;
  final int duration;
  final double averageRating;

  final String poster;
  final String director;
  final List<String> actors;
  final String trailerUrl;

  final List<Review>? reviews;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.synopsis,
    required this.genre,
    required this.duration,
    required this.averageRating,
    required this.poster,
    required this.director,
    required this.actors,
    required this.trailerUrl,
    this.reviews,
  });

  factory Movie.fromJson(
    Map<String, dynamic> json,
  ) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      year: json['year'] as int,
      synopsis: json['synopsis'] as String,
      genre: json['genre'] as String,
      duration: json['duration'] as int,
      averageRating: (json['average_rating'] as num).toDouble(),
      poster: json['poster'] as String,
      director: json['director'] as String,
      trailerUrl: json['trailer_url'] as String,
      actors: List<String>.from(
        json['actors'],
      ),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) => Review.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'synopsis': synopsis,
      'genre': genre,
      'duration': duration,
      'average_rating': averageRating,
      'poster': poster,
      'director': director,
      'actors': actors,
      'trailer_url': trailerUrl,
      'reviews': reviews
          ?.map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }

  @override
  String toString() {
    return '''
Movie(
  id: $id,
  title: $title,
  year: $year,
  synopsis: $synopsis,
  genre: $genre,
  duration: $duration,
  averageRating: $averageRating,
  director: $director,
  actors: $actors,
  trailerUrl: $trailerUrl
)
''';
  }
}
