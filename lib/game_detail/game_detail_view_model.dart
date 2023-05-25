import 'package:boardgames/game_detail/game_detail_state.dart';
import 'package:flutter/cupertino.dart';

class GameDetailViewModel extends ChangeNotifier {
  //final GameDAO dao
  GameDetailState _state = GameDetailState(
      title: "GameBoard",
      description: "description description description description",
      genre: "genre",
      rating: 0.5
  );

  BoardGameViewModel() {
    //real state z dao
  }

  String get title => _state.title;
  String get description => _state.description;
  String get genre => _state.genre;
  double get rating => _state.rating;

  void updateRating(double newRating) {
    _state = GameDetailState(
        title: _state.title,
        description: _state.description,
        genre: _state.genre,
        rating: newRating
    );
    notifyListeners();
  }
}