import 'dart:math';
import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/pages/game_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';

class HomePageGamesDAO extends GameDAO {

  @override
  Future<List<GameDetailSimpleState>> get() async {
    final games = await firebaseDAO.getBoardGames();

    final gameList = await Future.wait(games.map((game) => fetchGameDetailState(game.title!)));

    return gameList;
  }

  @override
  Future<GameDetailSimpleState> getRandom() async {
    final list = await get();
    final rand = Random();
    return list[rand.nextInt(list.length)];
  }

  Future<GameDetailSimpleState> fetchGameDetailState(String title) async {
    final snapshot = await firebaseDAO.getBoardGameByTitle(title);

    final genre = snapshot.genre!;
    final rating = snapshot.rating!.toDouble();
    final image = snapshot.img!;

    final gameDetailSimpleState = GameDetailSimpleState(
      title: title,
      genre: getGenreFromString(genre),
      imageUrls: [image],
      rating: rating,
    );

    return gameDetailSimpleState;
  }
}
