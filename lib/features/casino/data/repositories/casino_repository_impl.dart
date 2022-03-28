import '../../domain/entities/casino_game.dart';
import '../../domain/repositories/casino_repository.dart';
import '../datasources/remote_data_source.dart';

class CasinoRepositoryImpl implements CasinoRepository {
  final CasinoRemoteDateSource dataSource;

  CasinoRepositoryImpl({required this.dataSource});

  @override
  Future<List<CasinoGame>> fetchGames() async {
    return await dataSource.fetchCasinoGames();
  }

  @override
  Future<String> startPlayCasinoDemoMode(int gameId) async {
    return await dataSource.startPlayCasinoDemoMode(gameId);
  }
}
