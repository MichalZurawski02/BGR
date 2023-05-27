import 'package:boardgames/game_genre.dart';

class GameDetailState {
  final String title;
  final String description;
  final GameGenre genre;
  final List<String> imageUrls;
  double rating;
  double userRating;
  bool addedToFavourites;

  GameDetailState({
    required this.title,
    required this.description,
    required this.genre,
    required this.imageUrls,
    required this.rating,
    required this.userRating,
    required this.addedToFavourites
  });
}