import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/casino_repository_impl.dart';
import '../../domain/usecases/fetch_casino_games_usecase.dart';
import '../bloc/casino_games_bloc.dart';
import 'game_screen.dart';

class CasinoGamesScreen extends StatelessWidget {
  static String routePath = '/casino';
  const CasinoGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataSource = CasinoRemoteDateSource(client: http.Client());
    final repository = CasinoRepositoryImpl(dataSource: dataSource);
    final useCase = FetchCasinoGamesUseCase(repository: repository);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casino'),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (context) => CasinoGamesBloc(
                fetchGameUseCase: useCase,
                playDemoModeUseCase: null,
              )..add(LoadCasinoGames()),
          child: Builder(builder: (context) {
            return BlocBuilder<CasinoGamesBloc, CasinoGamesState>(
              builder: (context, state) {
                if (state.status == ScreenStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status == ScreenStatus.failure) {
                  return const Center(
                    child: Text('Fetch error'),
                  );
                } else if (state.status == ScreenStatus.loaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(15.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: state.games.length,
                    itemBuilder: (context, index) {
                      final game = state.games[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CasinoGameScreen.routePath,
                              arguments: game);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.hardEdge,
                          elevation: 4.0,
                          child: Image.network(
                            'https://development.kayamoola.co.za${game.image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            );
          })),
    );
  }
}
