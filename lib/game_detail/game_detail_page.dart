import 'package:flutter/material.dart';
import 'game_detail_view_model.dart';
import 'package:provider/provider.dart';

class GameDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameDetailViewModel>(
      create: (_) => GameDetailViewModel(),
      child: Consumer<GameDetailViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.title),
            ),
            body: Column(
              children: [
                Text(viewModel.description),
                Text('Rating: ${viewModel.rating}'),
                Slider(
                  value: viewModel.rating,
                  onChanged: (newRating) {
                    viewModel.updateRating(newRating);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}