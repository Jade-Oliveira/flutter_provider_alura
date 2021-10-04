import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber Depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textBotaoConfirmar = 'Confirmar';
final TextEditingController _controladorCampoValor = TextEditingController();

class FormularioDeposito extends StatelessWidget {
  const FormularioDeposito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  dica: _dicaCampoValor,
                  icone: Icons.monetization_on),
              //Botão, na propriedade onPressed consigo colocar os eventos do clique do botão
              //onPressed recebe uma function que seria um callback
              ElevatedButton(
                  onPressed: () => _criaDeposito(context),
                  child: Text(_textBotaoConfirmar))
            ],
          ),
        ));
  }

  _criaDeposito(context) {
    //salvo o valor já transformado em double
    final double valor = double.tryParse(_controladorCampoValor.text)!;
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    //usa esse provider para pegar o valor que estiver lá dentro e adicionar no formulário
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
