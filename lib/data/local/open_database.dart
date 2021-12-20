import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/widgets.dart';

late final Future<Database> database;

void getDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), 'bored_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE ideas(id INTEGER PRIMARY KEY, ideaName TEXT)',
      );
    },
    version: 1,
  );
}
