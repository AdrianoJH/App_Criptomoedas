import 'package:flutter/material.dart';
import 'package:app_criptomoedas/pages/CriptomoedasPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criptomoedas',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: CriptomoedasPage(),
    );
  }
}
