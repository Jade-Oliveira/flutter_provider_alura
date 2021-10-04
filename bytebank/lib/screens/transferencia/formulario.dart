import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _rotuloDicaValor = '0.00';
const _rotuloNumeroConta = 'Número da Conta';
const _rotuloDicaConta = '0000';
const _textBotao = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
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
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor!, numeroConta!);
      //função que vai tirar essa tela da pilha de telas e volta para a lista

      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSufuciente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;
    //utilizo o provider, mas como não quero que ele fique atualizando o tempo todo uso o listen:false, só quero um dado que tá lá
    //só consigo validar a tranferência se os campos estiverem preenchidos e o saldo for suficiente

    return _camposPreenchidos && _saldoSufuciente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    //adiciona nova transferência
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    //Subtrai esse valor de transferência do saldo
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }
}
