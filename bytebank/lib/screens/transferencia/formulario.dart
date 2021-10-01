import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _rotuloDicaValor = '0.00';
const _rotuloNumeroConta = 'Número da Conta';
const _rotuloDicaConta = '0000';
const _textBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_tituloAppBar)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  rotulo: _rotuloNumeroConta,
                  dica: _rotuloDicaConta),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  dica: _rotuloDicaValor,
                  icone: Icons.monetization_on),
              //Botão, na propriedade onPressed consigo colocar os eventos do clique do botão
              //onPressed recebe uma function que seria um callback
              ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  child: Text(_textBotao))
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      //função que vai tirar essa tela da pilha de telas e volta para a lista
      //o pop vai notificar a lista e essa notificação vai ser recebida no then
      //transferenciaCriada é o valor que vai voltar para o future
      //o context teve que ser recebido via parâmetro dentro do método para acessarmos aqui
      //then é um callback que funciona de maneira assíncrona
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
