import 'dart:async';

import 'package:bytebank/model/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'accountNumber INTEGER)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<void> save(ContactModel contact) async {
  final db = await createDatabase();
  await db.insert(
    'contacts',
    contact.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<ContactModel>> findAll() async {
  final db = await createDatabase();
  final List<Map<String, dynamic>> maps = await db.query('contacts');
  return List.generate(maps.length, (i) {
    return ContactModel(
      maps[i]['id'],
      maps[i]['name'],
      maps[i]['accountNumber'],
    );
  });
}
