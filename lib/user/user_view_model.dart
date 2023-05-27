import 'package:boardgames/user/user_state.dart';
import 'package:flutter/material.dart';
import '../enums/game_genre.dart';

class UserViewModel extends ChangeNotifier {
  //final UserDAO dao
  UserState _state = UserState(
      username: "User1234",
      favouriteGenre: GameGenre.logic,
      numberOfRated: 123,
      numberOfFavourites: 31,
      averageRating: 6.7
  );

  UserViewModel() {
    //stworz _state z dao
  }

  String get username => _state.username;
  String get favouriteGenre => _state.favouriteGenre.toString().split('.').last;
  int get numberOfRated => _state.numberOfRated;
  int get numberOfFavourites => _state.numberOfFavourites;
  double get averageRating => _state.averageRating;

  IconData getGenreIcon() {
    switch (_state.favouriteGenre) {
      case GameGenre.strategy:
        return Icons.leaderboard;
      case GameGenre.economics:
        return Icons.paid;
      case GameGenre.party:
        return Icons.celebration;
      case GameGenre.logic:
        return Icons.lightbulb;
      case GameGenre.family:
        return Icons.people;
      default:
        return Icons.category;
    }
  }
}