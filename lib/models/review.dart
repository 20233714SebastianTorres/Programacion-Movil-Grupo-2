// lib/models/review.dart

import 'movie.dart';
import 'user.dart';

class Review {
  final int id;
  final String content;
  final double rating;

  final int userId;
  final int movieId;

  final User? user;
  final Movie? movie;

  Review({
    required this.id,
    required this.content,
    required this.rating,
    required this.userId,
    required this.movieId,
    this.user,
    this.movie,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as int,
      content: json['content'] as String,
      rating: (json['rating'] as num).toDouble(),
      userId: json['user_id'] as int,
      movieId: json['movie_id'] as int,
      user: json['user'] != null
          ? User.fromJson(
              json['user'] as Map<String, dynamic>,
            )
          : null,
      movie: json['movie'] != null
          ? Movie.fromJson(
              json['movie'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'rating': rating,
      'user_id': userId,
      'movie_id': movieId,
      'user': user?.toJson(),
      'movie': movie?.toJson(),
    };
  }

  @override
  String toString() {
    return '''
Review(
  id: $id,
  content: $content,
  rating: $rating,
  userId: $userId,
  movieId: $movieId,
  user: $user,
  movie: $movie
)
''';
  }
}
