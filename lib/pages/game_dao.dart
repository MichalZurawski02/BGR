import 'package:boardgames/pages/game_detail/game_detail_state.dart';

import '../firebase_access_object.dart';

abstract class GameDAO {
  final firebaseDAO = FirebaseDAO();

  Future<List<GameDetailSimpleState>> get();
  Future<GameDetailSimpleState> getRandom();
}