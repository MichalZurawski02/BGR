import 'package:boardgames/enums/sort_by.dart';
import 'package:boardgames/enums/sort_direction.dart';
import 'package:boardgames/game_detail/game_detail_state.dart';

class HomePageState {
  SortBy by = SortBy.rating;
  SortDirection direction = SortDirection.descending;
  List<GameDetailSimpleState> games = [];
  HomePageState({required this.games});
}