import 'package:boardgames/enums/sort_by.dart';
import 'package:boardgames/game_detail/game_detail_state.dart';
import 'package:boardgames/home/home_page_dao.dart';
import 'package:flutter/cupertino.dart';

import 'home_page_state.dart';

class HomePageViewModel extends ChangeNotifier {
  late HomePageDAO dao = HomePageDAO();
  late final HomePageState _state = dao.get();

  late String sortBy = _state.by.toString();
  late String sortDir = _state.direction.toString();
  late List<GameDetailSimpleState> games = _state.games;
}