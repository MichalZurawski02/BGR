import 'package:boardgames/enums/game_genre.dart';
import 'package:boardgames/pages/game_dao.dart';
import 'package:boardgames/pages/game_detail/game_detail_state.dart';

class FavouritePageGamesDAO extends GameDAO {
  @override
  List<GameDetailSimpleState> get() {
    List<GameDetailSimpleState> list = [];
    list.add(GameDetailSimpleState(title: "Everdell", genre: GameGenre.Abstract, imageUrls: [
      'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
      'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
      'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
    ], rating: 8.5));
    list.add(GameDetailSimpleState(title: "Zwierzecy front", genre: GameGenre.Strategy, imageUrls: [
      'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
      'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
      'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
    ],rating: 10));
    list.add(GameDetailSimpleState(title: "Na skrzydlach", genre: GameGenre.Strategy, imageUrls: [
      'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT76dKDbC5K-E7hOfDx6Iq2R0omeb2lI6orSIr0U214DFJZ5noCdILi9CurX5n2b9Tr',
      'https://cdn.britannica.com/71/234471-050-093F4211/shiba-inu-dog-in-the-snow.jpg',
      'https://preview.redd.it/rc36dac8b5hz.jpg?auto=webp&s=52a8807c67a00edf79128d1e12d4d791de569321',
    ],rating: 9));
    return list;
  }
}