import 'dart:ffi';

class GameDetailState {
  final String title;
  final String description;
  final String genre;
  double rating;
  double userRating;
  bool addedToFavourites;

  GameDetailState({
    required this.title,
    required this.description,
    required this.genre,
    required this.rating,
    required this.userRating,
    required this.addedToFavourites
  });
}