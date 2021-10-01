import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        //TextStyle altera todo o conteúdo de texto dentro desse widget
        style: TextStyle(
          fontSize: 24.0,
        ),
        //decoration dá acesso as properties para modificar o textfield
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        //muda o tipo de input do usuário para número
        keyboardType: TextInputType.number,
      ),
    );
  }
}
