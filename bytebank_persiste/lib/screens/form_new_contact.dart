import 'package:bytebank_persiste/components/contact.dart';
import 'package:bytebank_persiste/database/contact_dao.dart';
import 'package:bytebank_persiste/models/editor_new_contact.dart';
import 'package:flutter/material.dart';

class FormNewContact extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAccountNumber = TextEditingController();
  final String _name = 'Full name';
  final String _nameHint = 'Fulano de tal';
  final String _accountNumber = 'Account Number';
  final String _accountNumberHint = '0000';
  final ContactDao _dao = ContactDao();

  final String _titulo = 'New contact';
  final String _textButtonCreate = 'Create';
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditorNewContact(_name, _nameHint, _controllerName),
            EditorNewContact(
              _accountNumber,
              _accountNumberHint,
              _controllerAccountNumber,
              numerico: true,
              quantidadeLimite: 4,
            ),
            RaisedButton(
              child: Text(_textButtonCreate),
              onPressed: () => _newContact(context),
            )
          ],
        ),
      ),
    );
  }

  void _newContact(BuildContext context){
    final String name = _controllerName.text;
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);
    if(name != null && accountNumber != null){
      final newContact = Contact(0, name, accountNumber);
      debugPrint('Creating contact');
      _dao.save(newContact).then((id) => Navigator.pop(context));
    }

  }

}
