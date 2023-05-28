import 'package:boardgames/pages/user/user_dao.dart';
import 'package:boardgames/pages/user/user_state.dart';
import 'package:flutter/material.dart';
import '../../enums/game_genre.dart';

class UserViewModel extends ChangeNotifier {
  UserDAO? _dao;
  UserState _state = UserState(
      username: "User1234",
      favouriteGenre: GameGenre.Abstract,
      numberOfRated: 123,
      numberOfFavourites: 31,
      averageRating: 6.7);

  UserViewModel() {
    _dao = UserDAO();
    _loadUser();
  }

  Future<void> _loadUser() async {
    await _dao?.getData();
    final state = await _dao?.getUserState();
    //print('Loaded State: $state');
    if (state != null) {
      _state = state;
      notifyListeners();
    }
  }

  String get username => _state.username;
  String get favouriteGenre => _state.favouriteGenre.toString().split('.').last;
  int get numberOfRated => _state.numberOfRated;
  int get numberOfFavourites => _state.numberOfFavourites;
  double get averageRating => _state.averageRating;

  IconData getGenreIcon() {
    switch (_state.favouriteGenre) {
      case GameGenre.Strategy:
        return Icons.leaderboard;
      case GameGenre.Thematic:
        return Icons.paid;
      case GameGenre.Party:
        return Icons.celebration;
      case GameGenre.Abstract:
        return Icons.lightbulb;
      case GameGenre.Family:
        return Icons.people;
      default:
        return Icons.category;
    }
  }
}
