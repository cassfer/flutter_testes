import 'package:bytebank_persiste/components/contact.dart';
import 'package:flutter/material.dart';

class ItemContact extends StatelessWidget{

  final Contact _contact;

  ItemContact(this._contact);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        title: Text(
          this._contact.name.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          this._contact.accountNumber.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

}