import 'package:boardgames/pages/favourites/favourites_page_dao.dart';
import 'package:boardgames/pages/games_view_model.dart';

class FavouritePageGamesViewModel extends GamesViewModel {
  FavouritePageGamesViewModel() {
    dao = FavouritePageGamesDAO();
    refresh();
  }
}