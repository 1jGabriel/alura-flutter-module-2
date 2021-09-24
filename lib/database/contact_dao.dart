import 'package:bytebank/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<void> save(ContactModel contact) async {
    final db = await createDatabase();
    await db.insert(
      _tableName,
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ContactModel>> findAll() async {
    final db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return ContactModel(
        maps[i][_id],
        maps[i][_name],
        maps[i][_accountNumber],
      );
    });
  }
}
