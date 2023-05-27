import 'package:boardgames/enums/game_genre.dart';

class GameDetailSimpleState {
  final String title;
  final GameGenre genre;
  final List<String> imageUrls;
  double rating;

  GameDetailSimpleState({
    required this.title,
    required this.genre,
    required this.imageUrls,
    required this.rating
  });
}

class GameDetailState extends GameDetailSimpleState {
  final String description;
  double userRating;
  bool addedToFavourites;

  GameDetailState({
    required title,
    required this.description,
    required genre,
    required imageUrls,
    required rating,
    required this.userRating,
    required this.addedToFavourites
  }):
        super(title: title, genre: genre, imageUrls: imageUrls,rating: rating);
}