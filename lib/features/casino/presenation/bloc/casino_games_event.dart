part of 'casino_games_bloc.dart';

@immutable
abstract class CasinoGamesEvent {}

class LoadCasinoGames extends CasinoGamesEvent {}

class StartPlayDemoMode extends CasinoGamesEvent {
  final int gameId;

  StartPlayDemoMode({required this.gameId});
}
