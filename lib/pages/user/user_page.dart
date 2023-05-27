import 'package:boardgames/pages/favourites/favourites_page_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:boardgames/pages/home/home_page.dart';
import 'package:boardgames/pages/home/home_page_dao.dart';
import 'package:flutter/material.dart';
import '../game_detail/game_detail_page.dart';
import 'user_view_model.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel(),
      child: Consumer<UserViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hello,',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      viewModel.username,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                viewModel.getGenreIcon(),
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Your favourite genre:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                viewModel.favouriteGenre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Games You rated:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                viewModel.numberOfRated.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Your favourites:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                viewModel.numberOfFavourites.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.bar_chart,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Average Rating:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                viewModel.averageRating.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      "What are You gonna play today?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Discover',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'New Game',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: Colors.white),
                                  ), backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                icon: const Icon(Icons.casino_rounded, color: Colors.white),
                                label: const Text('Random'),
                                onPressed: () {
                                  //Todo: podpiac tytul po przerobieniu gameDetail
                                  print(HomePageGamesDAO().getRandom().title);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GameDetailPage()));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Draw one',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'of your classics',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: Colors.white),
                                  ), backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                icon: const Icon(Icons.favorite, color: Colors.white),
                                label: const Text('Favourite'),
                                onPressed: () {
                                  //Todo: podpiac tytul po przerobieniu gameDetail
                                  print(FavouritePageGamesDAO().getRandom().title);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GameDetailPage()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'or choose by yourself:',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.blue),
                                ), backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              icon: const Icon(Icons.all_inclusive, color: Colors.blue),
                              label: const Text(
                                'All games',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                              },
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.blue),
                                ), backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              icon: const Icon(Icons.favorite_border_outlined, color: Colors.blue),
                              label: const Text(
                                'My favourites',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())); //change to favorites page
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
