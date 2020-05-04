import 'package:bytebank_persiste/components/contact.dart';
import 'package:bytebank_persiste/database/contact_dao.dart';
import 'package:bytebank_persiste/models/item_contact.dart';
import 'package:bytebank_persiste/models/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

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
  final LocalAuthentication _localAuthentication = LocalAuthentication();

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
        onPressed: () async {
          if(await _isBiometricAvailable()){
            await _getListOfBiometricTypes();
            if(await _authenticateUser()){
              Navigator.pushNamed(context, '/contacts_list/form_new_contact').then((context) {
                if (context!= null) {
                  print("chegou no then do context");
                  setState(() {
                    print("carregado");
                  });
                }
              });
            } else {
              print('Nao permitido');
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    print(listOfBiometrics);
  }

  static const androidStrings = const AndroidAuthMessages(
    fingerprintHint: 'Clica o botao ai źe',
    fingerprintNotRecognized: 'Voce tem a permissao?',
    cancelButton: 'Cancela mané',
    fingerprintSuccess: 'Adiciona ai, playboy',
    signInTitle: 'Se quiser entrar, o dedo deve pertencer ao celular dono',
    fingerprintRequiredTitle: 'Autentica ai'
  );

  Future<bool> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
        "Please authenticate to add a new Contact",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return false;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if(isAuthenticated){
      return true;
    } else {
      return false;
    }
  }

}
