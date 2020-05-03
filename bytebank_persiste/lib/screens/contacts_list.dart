import 'package:bytebank_persiste/components/contact.dart';
import 'package:bytebank_persiste/database/contact_dao.dart';
import 'package:bytebank_persiste/models/item_contact.dart';
import 'package:bytebank_persiste/models/loading_screen.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList> {
  final String _titulo = 'Contacts';
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: FutureBuilder(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return LoadingScreen();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ItemContact(contact);
                },
              );
              break;
          }
          return Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contacts_list/form_new_contact').then((context) {
            if (context!= null) {
              print("chegou no then do context");
              setState(() {
                print("carregado");
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
