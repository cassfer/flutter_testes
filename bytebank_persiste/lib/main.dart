import 'package:bytebank_persiste/screens/contacts_list.dart';
import 'package:bytebank_persiste/screens/form_new_contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank_persiste/screens/dashboard.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/contacts_list': (context) => ContactsList(),
        '/contacts_list/form_new_contact': (context) => FormNewContact(),
      },
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
