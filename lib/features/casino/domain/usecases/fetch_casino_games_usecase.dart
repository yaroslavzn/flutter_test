import '../../../../core/usecases/usecase.dart';
import '../entities/casino_game.dart';
import '../repositories/casino_repository.dart';

class FetchCasinoGamesUseCase extends UseCase<List<CasinoGame>, NoParams> {
  final CasinoRepository repository;

  FetchCasinoGamesUseCase({required this.repository});

  @override
  Future<List<CasinoGame>> call(NoParams params) async {
    return await repository.fetchGames();
  }
}
