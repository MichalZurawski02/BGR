import 'package:boardgames/enums/sort_by.dart';
import 'package:boardgames/game_detail/game_detail_state.dart';
import 'package:boardgames/home/home_page_dao.dart';
import 'package:flutter/cupertino.dart';

import 'home_page_state.dart';

class HomePageViewModel extends ChangeNotifier {
  late HomePageDAO dao;
  late HomePageState state;

  HomePageViewModel({required this.dao}):
    state = dao.get();

  late String sortBy = state.by.toString();
  late String sortDir = state.direction.toString();
  late List<GameDetailSimpleState> games = state.games;
}