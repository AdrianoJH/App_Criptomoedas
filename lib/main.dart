import 'package:app_criptomoedas/config/app_settings.dart';
import 'package:app_criptomoedas/repositories/conta_repository.dart';
import 'package:provider/provider.dart';
import 'package:app_criptomoedas/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'config/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContaRepository()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
      ],
      child: MyApp(),
    ),
  );
}
