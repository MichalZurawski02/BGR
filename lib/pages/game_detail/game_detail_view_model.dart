import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:flutter/material.dart';

class GameDetailViewModel extends ChangeNotifier {
  //final GameDAO dao
  GameDetailState _state = GameDetailState(
      title: "default board game",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
          " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
          " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      genre: GameGenre.Thematic,
      imageUrls: [
        'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
        'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
        'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
        ],
      rating: 9.5,
      userRating: 0,
      addedToFavourites: false
  );

  GameDetailViewModel() {
    //stworz _state z dao
  }

  String get title => _state.title;
  String get description => _state.description;
  String get genre => _state.genre.toString().split('.').last;
  List<String> get imageUrls => _state.imageUrls;
  double get rating => _state.rating;
  double get userRating => _state.userRating;
  bool get addedToFavourites => _state.addedToFavourites;

  void updateRating(double newRating) {
    _state = GameDetailState(
        title: _state.title,
        description: _state.description,
        genre: _state.genre,
        imageUrls: _state.imageUrls,
        rating: _state.rating,
        userRating: newRating,
        addedToFavourites: _state.addedToFavourites
    );
    notifyListeners();
    //dao.upsertUserRating(newRating)
  }

  void updateFavourites(bool addedToFavourites) {
    _state = GameDetailState(
        title: _state.title,
        description: _state.description,
        genre: _state.genre,
        imageUrls: _state.imageUrls,
        rating: _state.rating,
        userRating: _state.userRating,
        addedToFavourites: addedToFavourites
    );
    notifyListeners();
    //dao.upsertNewFavourite(...)
  }

  IconData getGenreIcon() {
    switch (_state.genre) {
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