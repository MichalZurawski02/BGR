import 'package:boardgames/enums/game_genre.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game_detail/game_detail_page.dart';
import 'home_page_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<GameGenre> selectedGenres = {};

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel(),
      child: Consumer<HomePageViewModel>(
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
                        itemCount: viewModel.games.length,
                        separatorBuilder: (context, index) {
                          final game = viewModel.games[index];
                          if(selectedGenres.isEmpty || selectedGenres.contains(game.genre)) {
                            return const SizedBox(height: 16.0);
                          }
                          return const SizedBox(height: 0.0);
                        },
                        itemBuilder: (context, index) {
                          final game = viewModel.games[index];
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


class ParallaxGameCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final VoidCallback? onTap;

  const ParallaxGameCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 150.0; // Adjust the card height as needed

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: cardHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
