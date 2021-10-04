import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.green[900]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormularioDeposito(),
                        ));
                  },
                  child: Text(
                    'Receber Depósito',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.green[900]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormularioTransferencia(),
                        ));
                  },
                  child: Text(
                    'Nova transferência',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            UltimasTramsferencias()
          ],
        ));
  }
}
