import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'Card.dart';

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
      await db.execute(
          "CREATE TABLE cards(datetime TEXT, progress INTEGER, questions TEXT)");
    }, version: 1);
  }

  Future<void> insertCard(QCard newCard) async {
    final db = await database;
    await db.insert("cards", newCard.toJson());
  }

  Future<List<QCard>> getCards() async {
    final db = await database;
    var res = await db.query("cards");
    print("1. SUCCES? ${res.isNotEmpty} //");
    List<QCard> list =
        res.isNotEmpty ? res.map((e) => QCard.fromJson(e)).toList() : [];
    print(list);
    return list;
  }

  Future<void> updateCards(QCard card) async {
    final db = await database;
    await db.update(
      'cards',
      card.toJson(),
      where: "date_time = ?",
      whereArgs: [card.dateTime.toIso8601String()],
    );
  }

  Future<void> deleteCard(DateTime dateTime) async {
    final db = await database;
    await db.delete(
      'cards',
      where: "date_time = ?",
      whereArgs: [dateTime],
    );
  }
}
