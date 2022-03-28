import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gh_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:gh_app/features/casino/presenation/screens/all_games_screen.dart';

import 'features/casino/presenation/screens/game_screen.dart';

void main(List<String> args) {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const GamingHubApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class GamingHubApp extends StatelessWidget {
  const GamingHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GH',
      debugShowCheckedModeBanner: false,
      routes: {
        SignInScreen.routePath: (context) => const SignInScreen(),
        CasinoGamesScreen.routePath: (context) => const CasinoGamesScreen(),
        CasinoGameScreen.routePath: (context) => const CasinoGameScreen(),
      },
      initialRoute: SignInScreen.routePath,
    );
  }
}
