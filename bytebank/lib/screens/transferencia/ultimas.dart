import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas Transferências';

class UltimasTramsferencias extends StatelessWidget {
  const UltimasTramsferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          //pega o array de transferências, invertendo e transformando novamente numa lista
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 2;

          if (_quantidade == 0) {
            return SemTransferenciaCadastratada();
          }

          if (_quantidade < 2) {
            tamanho = _quantidade;
          }
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green[900]),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaTranferencias(),
                ));
          },
          child: Text(
            'Ver todas transferências',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class SemTransferenciaCadastratada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou\n nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
