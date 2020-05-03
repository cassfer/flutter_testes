import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'contact_dao.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, versio) {
      db.execute(ContactDao.sqlCreate);
    },
    version: 1,
  );
}


