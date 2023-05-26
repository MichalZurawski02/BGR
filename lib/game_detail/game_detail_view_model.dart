import 'package:boardgames/game_detail/game_detail_state.dart';
import 'package:flutter/cupertino.dart';

class GameDetailViewModel extends ChangeNotifier {
  //final GameDAO dao
  GameDetailState _state = GameDetailState(
      title: "default board game",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
          " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
          " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      genre: "default genre",
      rating: 9.5,
      userRating: 0,
      addedToFavourites: false
  );

  BoardGameViewModel() {
    //stworz _state z dao
  }

  String get title => _state.title;
  String get description => _state.description;
  String get genre => _state.genre;
  double get rating => _state.rating;
  double get userRating => _state.userRating;
  bool get addedToFavourites => _state.addedToFavourites;

  void updateRating(double newRating) {
    _state = GameDetailState(
        title: _state.title,
        description: _state.description,
        genre: _state.genre,
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
        rating: _state.rating,
        userRating: _state.userRating,
        addedToFavourites: addedToFavourites
    );
    notifyListeners();
    //dao.upsertNewFavourite(...)
  }
}