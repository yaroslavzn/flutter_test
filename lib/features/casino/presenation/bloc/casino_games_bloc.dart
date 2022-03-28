import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/casino_game.dart';
import '../../domain/usecases/fetch_casino_games_usecase.dart';
import '../../domain/usecases/start_casino_game_demo_mode_usecase.dart';

part 'casino_games_event.dart';
part 'casino_games_state.dart';

class CasinoGamesBloc extends Bloc<CasinoGamesEvent, CasinoGamesState> {
  final FetchCasinoGamesUseCase? fetchGameUseCase;
  final StartPlayCasinoDemoModeUseCase? playDemoModeUseCase;

  CasinoGamesBloc({
    required this.fetchGameUseCase,
    required this.playDemoModeUseCase,
  }) : super(CasinoGamesState()) {
    on<LoadCasinoGames>(_loadCasinoGamesHandler);
    on<StartPlayDemoMode>(_startPlayDemoModeHandler);
  }

  _loadCasinoGamesHandler(event, emit) async {
    emit(state.copyWith(status: ScreenStatus.loading));

    try {
      final casinoGames = await fetchGameUseCase!(NoParams());
      emit(
        state.copyWith(games: casinoGames, status: ScreenStatus.loaded),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ScreenStatus.failure),
      );
    }
  }

  _startPlayDemoModeHandler(StartPlayDemoMode event, emit) async {
    emit(
      state.copyWith(status: ScreenStatus.loading),
    );

    try {
      final demoUrl = await playDemoModeUseCase!(event.gameId);

      emit(
        state.copyWith(status: ScreenStatus.loaded, launchUrl: demoUrl),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ScreenStatus.failure),
      );
    }
  }
}
