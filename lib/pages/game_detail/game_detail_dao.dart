import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/firebase_access_object.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:boardgames/globals.dart';

class GameDetailDAO {
  final String title;
  String description = "";
  String user = username;
  String genre = "";
  String image = "";
  double rating = 0;
  double userRating = 0;
  bool isFavourite = false;
  GameDetailState? state;

  final firebaseDAO = FirebaseDAO();

  GameDetailDAO({
    required this.title,
  }) {
    getData();
  }

  Future<void> getData() async {
    final snapshot = await firebaseDAO.getBoardGameByTitle(title);
    description = snapshot.description!;
    genre = snapshot.genre!;
    rating = snapshot.rating!.toDouble();
    image = snapshot.img!;

    final userRatingSnapshot = await firebaseDAO.getRating(user, title);
    userRating = userRatingSnapshot.toDouble();

    final isFavouriteSnapshot = await firebaseDAO.isFav(user, title);
    isFavourite = isFavouriteSnapshot;

    state = GameDetailState(
      title: title,
      description: description,
      genre: getGenreFromString(genre),
      imageUrls: [
        image
      ],
      rating: rating,
      userRating: userRating,
      addedToFavourites: isFavourite,
    );
  }

  Future<GameDetailState?> getState() async {
    return state;
  }

  void addUserRating(double newRating) {
    firebaseDAO.postRating(title, user, newRating, isFavourite);
  }

  void addNewFavourite(bool addedToFavourites) {
    firebaseDAO.postRating(title, user, userRating, addedToFavourites);
  }
}
