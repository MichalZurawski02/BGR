import 'dart:ffi';

class GameDetailState {
  final String title;
  final String description;
  final String genre;
  double rating;
  GameDetailState({
    required this.title,
    required this.description,
    required this.genre,
    required this.rating});
}