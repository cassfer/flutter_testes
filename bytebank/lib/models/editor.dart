import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;
  final int tamanho;

  Editor({this.controlador, this.rotulo, this.dica, this.icon, this.tamanho});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: this.controlador,
        maxLength: this.tamanho,
        decoration: InputDecoration(
          labelText: this.rotulo,
          hintText: this.dica,
          icon: Icon(this.icon) != null ? Icon(icon) : null,
        ),
        style: TextStyle(
          fontSize: 24,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}