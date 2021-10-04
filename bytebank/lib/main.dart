import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//inicialmente precisamos apontar quem o provide vai gerenciar
void main() => runApp(MultiProvider(
      //quais são os dados que ele tem que observar, só executa uma vez, não vai atualizar saldo por aqui
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),
        ChangeNotifierProvider(
          create: (context) => Transferencias(),
        )
      ],
      //bytebankapp tem acesso a todos os providers da lista
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
