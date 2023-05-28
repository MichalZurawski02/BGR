import 'package:boardgames/pages/game_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:flutter/cupertino.dart';

abstract class GamesViewModel extends ChangeNotifier {
  bool sorted = false;
  late GameDAO dao;
  late List<GameDetailSimpleState> _games = [];

  List<GameDetailSimpleState> get() {
    return _games;
  }
  void sort() {
    sorted = true;
    _games.sort((b, a) => a.rating.compareTo(b.rating));
    notifyListeners();
  }

  Future<void> refresh() async {
    await dao.get();
    final state = await dao.get();
    _games = state;
    notifyListeners();
  }
}