import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/firebase_access_object.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';
import 'package:boardgames/globals.dart';

class GameDetailDAO {
  final String title;
  String description = "";
  String user = username;
  String genre = "";
  double rating = 0;
  double userRating = 0;
  bool isFavourite = false;
  GameDetailState? state = null;

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

    final userRatingSnapshot = await firebaseDAO.getRating(user, title);
    userRating = userRatingSnapshot.toDouble();

    final isFavouriteSnapshot = await firebaseDAO.isFav(user, title);
    isFavourite = isFavouriteSnapshot;

    print('Description: ${snapshot.description}');
    print('Genre: ${snapshot.genre}');
    print('Rating: ${snapshot.rating}');

    state = GameDetailState(
      title: title,
      description: description,
      genre: getGenreFromString(genre),
      imageUrls: [
        'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
        'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
        'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
      ],
      rating: rating,
      userRating: 0.0,
      addedToFavourites: true,
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
