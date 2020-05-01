import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const PrimaryColor = Colors.green;

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

//Item que adiciona a tela formulario Transferencia

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transfêrencia'),
        backgroundColor: PrimaryColor,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              decoration: InputDecoration(
                labelText: 'Numero da conta',
                hintText: '0000',
              ),
              style: TextStyle(
                fontSize: 24,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controladorCampoValor,
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icon(Icons.monetization_on),
              ),
              style: TextStyle(
                fontSize: 24,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              debugPrint('here we go');
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (valor != null && numeroConta != null) {
                final transfrenciaCriada = Transferencia(valor, numeroConta);
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('$transfrenciaCriada')));
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error')));
              }
            },
          ),
        ],
      ),
    );
  }
}

//Item que adiciona a tela de lista de transferencias

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
        backgroundColor: PrimaryColor,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 2)),
          ItemTransferencia(Transferencia(200, 3)),
          ItemTransferencia(Transferencia(300, 5)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

//Classe que adiciona um item para o menu de transferencia

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
      ),
    );
  }
}

//Classe para realizar transferencia bancaria

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
