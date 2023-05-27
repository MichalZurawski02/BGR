import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/game_detail/game_detail_state.dart';
import 'package:boardgames/home/home_page_state.dart';

class HomePageDAO {
  HomePageState get() {
    List<GameDetailSimpleState> list = [];
    list.add(GameDetailSimpleState(title: "Catan", genre: GameGenre.logic, rating: 3));
    list.add(GameDetailSimpleState(title: "Taboo", genre: GameGenre.party, rating: 7.8));
    list.add(GameDetailSimpleState(title: "Everdell", genre: GameGenre.logic, rating: 8.5));
    list.add(GameDetailSimpleState(title: "Zwierzecy front", genre: GameGenre.logic, rating: 10));
    list.add(GameDetailSimpleState(title: "Na skrzydlach", genre: GameGenre.strategy, rating: 9));
    return HomePageState(games: list);
  }
}