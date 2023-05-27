import 'package:boardgames/pages/game_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:flutter/cupertino.dart';

abstract class GamesViewModel extends ChangeNotifier {
  late GameDAO dao;
  late final List<GameDetailSimpleState> _games = dao.get();

  List<GameDetailSimpleState> get() {
    return _games;
  }
}