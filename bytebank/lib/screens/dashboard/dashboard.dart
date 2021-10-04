import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        //pai como responsável por controlar a posição do widget filho, no caso o saldo
        body: ListView(
          children: [
            Align(
              child: SaldoCard(),
              alignment: Alignment.topCenter,
            ),
            //para ter acesso ao saldo precisamos desse consumer do provider
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioDeposito(),
                    ));
              },
              child: Text('Receber Depósito'),
            )
          ],
        ));
  }
}
