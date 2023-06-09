import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'game_detail_view_model.dart';

class GameDetailPage extends StatelessWidget {
  String game = "";
  GameDetailPage( {required String this.game});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameDetailViewModel>(
      create: (_) => GameDetailViewModel(game: game),
      child: Consumer<GameDetailViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            items: viewModel.imageUrls.map((item) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200.0,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              enableInfiniteScroll: true,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            right: 16.0,
                            child: GestureDetector(
                              onTap: () {
                                viewModel.updateFavourites(
                                  !viewModel.addedToFavourites,
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: viewModel.addedToFavourites
                                      ? Colors.redAccent
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: viewModel.addedToFavourites
                                        ? Colors.redAccent
                                        : Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: viewModel.addedToFavourites
                                        ? Colors.white
                                        : Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        viewModel.title,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          Icon(
                            viewModel.getGenreIcon(),
                            color: Colors.blue,
                            size: 20.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            viewModel.genre,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                viewModel.rating.toString(),
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        viewModel.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Text(
                        'Rate this game:',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      RatingBar.builder(
                        initialRating: viewModel.userRating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemSize: 24.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          viewModel.updateRating(rating);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
