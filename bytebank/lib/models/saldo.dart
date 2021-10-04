import 'package:flutter/material.dart';

//para conseguir observar isso com o provider ele precisa ter essa extensão do ChangeNotifier
class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  //método que adiciona e altera o valor
  void adiciona(double valor) {
    this.valor += valor;

    //esse método do flutter vai avisar para os listeners que esse valor foi alterado
    notifyListeners();
  }

  void subtrai(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
