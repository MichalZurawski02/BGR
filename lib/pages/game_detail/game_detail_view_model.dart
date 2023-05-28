import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/pages/game_detail/game_detail_dao.dart';
import 'game_detail_state.dart';
import 'package:flutter/material.dart';

class GameDetailViewModel extends ChangeNotifier {
  String game = "";
  GameDetailDAO? _dao;

  GameDetailState _state = GameDetailState(
    title: "",
    description: "",
    genre: GameGenre.Thematic,
    imageUrls: [
      'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
      'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
      'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
    ],
    rating: 9.5,
    userRating: 0,
    addedToFavourites: false,
  );

  GameDetailViewModel({required this.game}) {
    _dao = GameDetailDAO(title: game);
    _loadGameDetail();
  }

  Future<void> _loadGameDetail() async {
    await _dao?.getData();
    final state = await _dao?.getState();
    print('Loaded State: $state');
    if (state != null) {
      _state = state;
      notifyListeners();
    }
  }

  String get title => _state.title;
  String get description => _state.description;
  String get genre => _state.genre.toString().split('.').last;
  List<String> get imageUrls => _state.imageUrls;
  double get rating => _state.rating;
  double get userRating => _state.userRating;
  bool get addedToFavourites => _state.addedToFavourites;

  void updateRating(double newRating) {
    _state.userRating = newRating;
    notifyListeners();
    _dao!.addUserRating(newRating);
  }

  void updateFavourites(bool addedToFavourites) {
    _state.addedToFavourites = addedToFavourites;
    notifyListeners();
    _dao!.addNewFavourite(addedToFavourites);
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
