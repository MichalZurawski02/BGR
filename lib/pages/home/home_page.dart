import 'package:boardgames/pages/home/home_page_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../default_games_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: no_logic_in_create_state
  GamesState createState() => GamesState(HomePageGamesViewModel());
}