import 'package:curso_flutter/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tutoria',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.blue,
      ),
      home: ListaTransferencias()
    );
  }
}




