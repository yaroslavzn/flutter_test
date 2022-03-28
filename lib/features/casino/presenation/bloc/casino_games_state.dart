part of 'casino_games_bloc.dart';

enum ScreenStatus { initial, loading, failure, loaded }

class CasinoGamesState {
  CasinoGamesState({
    this.status = ScreenStatus.initial,
    this.games = const [],
    this.launchUrl,
  });

  final ScreenStatus status;
  final List<CasinoGame> games;
  final String? launchUrl;

  CasinoGamesState copyWith(
      {ScreenStatus? status, List<CasinoGame>? games, String? launchUrl}) {
    return CasinoGamesState(
        status: status ?? this.status,
        games: games ?? this.games,
        launchUrl: launchUrl ?? this.launchUrl);
  }
}

// class CasinoGamesInitial extends CasinoGamesState {}

// class CasinoGamesLoading extends CasinoGamesState {}

// class CasinoGamesLoaded extends CasinoGamesState {
//   final List<CasinoGame> casinoGames;

//   CasinoGamesLoaded({required this.casinoGames});
// }

// class CasinoGamesLoadingFailure extends CasinoGamesState {}

// class CasinoGameLaunchSuccess extends CasinoGamesState {
//   final String launchUrl;

//   CasinoGameLaunchSuccess({required this.launchUrl});
// }
