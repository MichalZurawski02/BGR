import 'package:boardgames/pages/favourites/favourites_page_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../default_games_state.dart';

class FavouritePage extends StatefulWidget {
  @override
  GamesState createState() => GamesState(FavouritePageGamesViewModel());
}