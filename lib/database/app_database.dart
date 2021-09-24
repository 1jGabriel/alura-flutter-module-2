import 'dart:async';

import 'package:bytebank/database/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 5,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
