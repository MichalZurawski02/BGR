import 'package:boardgames/pages/games_view_model.dart';
import 'package:boardgames/pages/home/home_page_dao.dart';

class HomePageGamesViewModel extends GamesViewModel {
  HomePageGamesViewModel() {
    dao = HomePageGamesDAO();
  }
}