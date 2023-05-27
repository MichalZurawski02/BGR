// ignore_for_file: constant_identifier_names

enum GameGenre {
  Strategy,
  Thematic,
  Party,
  Abstract,
  Family
}

GameGenre getGenreFromString(String genre) {
  switch (genre) {
    case 'Strategy':
      return GameGenre.Strategy;
    case 'Thematic':
      return GameGenre.Thematic;
    case 'Party':
      return GameGenre.Party;
    case 'Abstract':
      return GameGenre.Abstract;
    case 'Family':
      return GameGenre.Family;
    default:
      return GameGenre.Strategy;
  }
}