import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

//classe que vai encapsular meus widgets

//criando um estado para o nosso widget
class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        backgroundColor: Colors.green,
      ),
      //mantém a lista de uma maneira dinâmica, diferente de usar só o LIstView, que é uma lista estática
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //controla o fluxo entre as telas, usa a route do materialDesign
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  //atributo privado
  final Transferencia _transferencia;

  //construtor
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      ),
    );
  }
}
