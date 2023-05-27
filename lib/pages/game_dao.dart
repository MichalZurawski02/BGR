import 'package:boardgames/pages/game_detail/game_detail_state.dart';

abstract class GameDAO {
  List<GameDetailSimpleState> get();
  GameDetailSimpleState getRandom();
}