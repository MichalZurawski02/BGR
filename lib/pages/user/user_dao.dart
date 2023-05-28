import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/firebase_access_object.dart';
import 'package:boardgames/pages/user/user_state.dart';

import 'package:boardgames/globals.dart' as globals;

class UserDAO {
  FirebaseDAO db = FirebaseDAO();
  String name = globals.username;
  GameGenre favouriteGenre = GameGenre.Abstract;
  int numberOfRated = 0;
  int numberOfFavourites = 0;
  double averageRating = 0;
  UserState? _state;

  UserDAO() {
    getData();
  }

  bool auth(String name, String password) {
    return db.authUser(name, password) as bool;
  }

  Future<void> getData() async {
    _GenreCounter genreCounter = _GenreCounter();
    final snapshot = await db.getRatingsByUsername(globals.username);
    final games = await db.getFavBoardGames(globals.username);

    for (RatingDataObject rating in snapshot) {
      if (rating.fav!) {
        try {
          var bg = await db.getBoardGameByTitle(rating.title!);
          genreCounter.updateCounter(bg.genre!);
        } catch (e) {}
        //numberOfFavourites += 1;
      }
      averageRating += rating.rating!;
    }
    averageRating /= snapshot.length;
    numberOfRated = snapshot.length;
    favouriteGenre = genreCounter.getResult();
    _state = UserState(
        username: name,
        favouriteGenre: GameGenre.Abstract,
        numberOfRated: numberOfRated,
        numberOfFavourites: games.length,
        averageRating: averageRating);
  }

  Future<UserState?> getUserState() async {
    return _state;
  }
}

class _GenreCounter {
  var stats = {
    "Strategy": 0,
    "Thematic": 0,
    "Party": 0,
    "Abstract": 0,
    "Family": 0
  };

  void updateCounter(String genreString) {
    if (stats.containsKey(genreString)) {
      var tmp = stats[genreString];
      stats[genreString] = tmp! + 1;
    }
  }

  GameGenre getResult() {
    var value = 0;
    String key = "Strategy";

    stats.forEach((k, v) {
      if (v > value) {
        value = v;
        key = k;
      }
    });

    return getGenreFromString(key);
  }
}
