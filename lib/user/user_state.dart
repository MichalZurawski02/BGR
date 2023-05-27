import 'package:boardgames/game_genre.dart';

class UserState {
  final String username;
  final GameGenre favouriteGenre;
  final int numberOfRated;
  final int numberOfFavourites;
  final double averageRating;

  UserState({
    required this.username,
    required this.favouriteGenre,
    required this.numberOfRated,
    required this.numberOfFavourites,
    required this.averageRating,
  });
}