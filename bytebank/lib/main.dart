import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//inicialmente precisamos apontar quem o provide vai gerenciar
void main() => runApp(ChangeNotifierProvider(
      //quais são os dados que ele tem que observar, só executa uma vez, não vai atualizar saldo por aqui
      create: (context) => Saldo(0),
      child: ByteBankApp(),
    ));

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
