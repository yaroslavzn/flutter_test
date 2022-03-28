import '../entities/casino_game.dart';

abstract class CasinoRepository {
  Future<List<CasinoGame>> fetchGames();
  Future<String> startPlayCasinoDemoMode(int gameId);
}
