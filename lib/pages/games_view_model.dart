import 'package:boardgames/pages/game_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:flutter/cupertino.dart';

abstract class GamesViewModel extends ChangeNotifier {
  bool sorted = false;
  late GameDAO dao;
  late List<GameDetailSimpleState> _games = dao.get();

  List<GameDetailSimpleState> get() {
    return _games;
  }
  void sort() {
    sorted = true;
    _games.sort((b, a) => a.rating.compareTo(b.rating));
    notifyListeners();
  }
  void refresh() {
    sorted = false;
    _games = dao.get();
    notifyListeners();
  }
}