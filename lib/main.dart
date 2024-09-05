import 'package:flutter/material.dart';
import 'views/principal.dart';
import 'components/botao_voador.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Atividade 1'),
        ),
        body: const Principal(),
        floatingActionButton: const BotaoVoador(),
      ),
    );
  }
}
