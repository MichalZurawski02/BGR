import 'dart:ffi';
import 'package:boardgames/enums/game_genre.dart';

class GameDetailSimpleState {
  final String title;
  final GameGenre genre;
  double rating;

  GameDetailSimpleState({
    required this.title,
    required this.genre,
    required this.rating
  });
}

class GameDetailState extends GameDetailSimpleState {
  final String description;
  final List<String> imageUrls;
  double userRating;
  bool addedToFavourites;

  GameDetailState({
    required title,
    required this.description,
    required genre,
    required this.imageUrls,
    required rating,
    required this.userRating,
    required this.addedToFavourites
  }):
        super(title: title, genre: genre, rating: rating);
}