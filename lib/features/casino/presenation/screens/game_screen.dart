import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/casino_repository_impl.dart';
import '../../domain/entities/casino_game.dart';
import '../../domain/usecases/start_casino_game_demo_mode_usecase.dart';
import '../bloc/casino_games_bloc.dart';

class CasinoGameScreen extends StatefulWidget {
  static String routePath = '/casino-game';
  const CasinoGameScreen({Key? key}) : super(key: key);

  @override
  State<CasinoGameScreen> createState() => _CasinoGameScreenState();
}

class _CasinoGameScreenState extends State<CasinoGameScreen> {
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataSource = CasinoRemoteDateSource(client: http.Client());
    final repository = CasinoRepositoryImpl(dataSource: dataSource);
    final useCase = StartPlayCasinoDemoModeUseCase(repository: repository);
    final game = ModalRoute.of(context)!.settings.arguments as CasinoGame;

    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CasinoGamesBloc(
          playDemoModeUseCase: useCase,
          fetchGameUseCase: null,
        )..add(
            StartPlayDemoMode(gameId: game.id),
          ),
        child: Builder(
          builder: (context) {
            return BlocBuilder<CasinoGamesBloc, CasinoGamesState>(
              builder: (context, state) {
                if (state.status == ScreenStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status == ScreenStatus.failure) {
                  return const Center(
                    child: Text('Launch game failure'),
                  );
                } else if (state.status == ScreenStatus.loaded) {
                  return WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: state.launchUrl,
                    key: UniqueKey(),
                  );
                }

                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
