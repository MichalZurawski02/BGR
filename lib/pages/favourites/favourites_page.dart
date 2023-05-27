// ignore_for_file: no_logic_in_create_state

import 'package:boardgames/pages/favourites/favourites_page_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../default_games_state.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  GamesState createState() => GamesState(FavouritePageGamesViewModel());
}