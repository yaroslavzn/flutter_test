import '../../../../core/usecases/usecase.dart';
import '../repositories/casino_repository.dart';

class StartPlayCasinoDemoModeUseCase extends UseCase<String, int> {
  final CasinoRepository repository;

  StartPlayCasinoDemoModeUseCase({required this.repository});

  @override
  Future<String> call(int params) async {
    return await repository.startPlayCasinoDemoMode(params);
  }
}
