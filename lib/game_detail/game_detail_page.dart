import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'game_detail_view_model.dart';

class GameDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameDetailViewModel>(
      create: (_) => GameDetailViewModel(),
      child: Consumer<GameDetailViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            items: [
                              'https://via.placeholder.com/300',
                              'https://via.placeholder.com/300',
                              'https://via.placeholder.com/300',
                            ].map((item) {
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
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: viewModel.addedToFavourites
                                      ? Colors.redAccent
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: viewModel.addedToFavourites
                                        ? Colors.redAccent // Pink stroke color when clicked
                                        : Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: viewModel.addedToFavourites
                                        ? Colors.white
                                        : Colors.grey,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        viewModel.title,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            viewModel.genre,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            viewModel.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        viewModel.description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Rate this game:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      RatingBar.builder(
                        initialRating: viewModel.userRating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemSize: 24.0,
                        itemBuilder: (context, _) => Icon(
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
