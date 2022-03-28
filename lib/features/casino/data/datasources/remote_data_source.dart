import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/casino_game.dart';
import '../models/casino_game_model.dart';

class CasinoRemoteDateSource {
  final http.Client client;

  CasinoRemoteDateSource({required this.client});

  Future<List<CasinoGame>> fetchCasinoGames() async {
    final url = Uri.https('development.api.kayamoola.co.za', '/casino/games',
        {'brand_id': 'KAYAMOOLA_CO_ZA'});

    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return (json.decode(response.body)['casino_games'] as List<dynamic>)
          .map((e) => CasinoGameModel.fromJson(e))
          .toList();
    }

    throw Exception();
  }

  Future<String> startPlayCasinoDemoMode(int gameId) async {
    final url = Uri.https(
      'development.api.kayamoola.co.za',
      '/casino/launch-demo/$gameId',
    );

    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final decodedBody = json.decode(response.body);

      return decodedBody['url'];
    }

    throw Exception();
  }
}
