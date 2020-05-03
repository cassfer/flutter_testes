import 'package:flutter/material.dart';

class EditorNewContact extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _dica;
  final bool numerico;
  final int quantidadeLimite;

  EditorNewContact(this._rotulo, this._dica, this._controller, {this.numerico: false, this.quantidadeLimite});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: this._rotulo,
          hintText: this._dica,
        ),
        keyboardType: verificaNumerico(numerico),
        style: TextStyle(
          fontSize: 24,
        ),
        maxLength: this.quantidadeLimite,
      ),
    );
  }
}

TextInputType verificaNumerico(numerico) {
  if (numerico) {
    return TextInputType.number;
  } else {
    return TextInputType.text;
  }
}