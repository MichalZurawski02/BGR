import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/pages/game_detail/game_detail_page.dart';
import 'package:boardgames/pages/games_view_model.dart';
import 'package:boardgames/widgets/parallax_game_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamesState extends State<StatefulWidget> {
  Set<GameGenre> selectedGenres = {};
  late GamesViewModel vm;

  GamesState(GamesViewModel viewModel) {
    vm = viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GamesViewModel>(
      create: (_) => vm,
      child: Consumer<GamesViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List<Widget>.generate(GameGenre.values.length, (index) {
                        final genre = GameGenre.values[index];
                        final isSelected = selectedGenres.contains(genre);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedGenres.remove(genre);
                              } else {
                                selectedGenres.add(genre);
                              }
                            });
                          },
                          child: Container(
                            width: 100.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                genre.name,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.separated(
                        itemCount: viewModel.get().length,
                        separatorBuilder: (context, index) {
                          final game = viewModel.get()[index];
                          if(selectedGenres.isEmpty || selectedGenres.contains(game.genre)) {
                            return const SizedBox(height: 16.0);
                          }
                          return const SizedBox(height: 0.0);
                        },
                        itemBuilder: (context, index) {
                          final game = viewModel.get()[index];
                          if (selectedGenres.isEmpty || selectedGenres.contains(game.genre)) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameDetailPage(),
                                  ),
                                );
                              },
                              child: ParallaxGameCard(
                                imageUrl: game.imageUrls[0],
                                title: game.title,
                                rating: game.rating,
                              ),
                            );
                          } else {
                            return Container(); // Return an empty container if the genre is not selected
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}