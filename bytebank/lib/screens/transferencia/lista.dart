import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

//classe que vai encapsular meus widgets
class ListaTranferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

//criando um estado para o nosso widget
class ListaTranferenciasState extends State<ListaTranferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        backgroundColor: Colors.green,
      ),
      //mantém a lista de uma maneira dinâmica, diferente de usar só o LIstView, que é uma lista estática
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //controla o fluxo entre as telas, usa a route do materialDesign
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
          //future - propriedade do navigator - é como se fosse um callback, ele fica atento as ações do navigator
          //quando esse future receber a notificação ele entra nesse then
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      //função específica para atualizar conteúdo dentro de um statefulWidget, depois que ela é executada chama o build novamente
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
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
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
