import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'archive.db'),
        onCreate: (db, version) async {
      await db.execute('''CREATE TABLE users (card)''');
    }, version: 1);
  }

  newCard(newCard) async {
    final db = await database;
    var res = await db.rawInsert('''
    INSERT INTO Cards(Card)
    VALUE (?)
    ''', [newCard.card]);
    return res;
  }

  Future<dynamic> getCard() async {
    final db = await database;
    var res = await db.query("card");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
