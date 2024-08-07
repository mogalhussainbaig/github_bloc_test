import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE my_table(id INTEGER PRIMARY KEY AUTOINCREMENT, my_string TEXT)",
        );
      },
      version: 1,
    );
  }

  // Insert a string into the database
  Future<void> insertString(String responseString) async {
    final db = await database;
    db.delete('my_table');
    await db.insert(
      'my_table',
      {'my_string': responseString},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all strings from the database
  Future<List<Map<String, dynamic>>> getAllStrings() async {
    final db = await database;
    return await db.query('my_table');
  }

  // Update a string in the database
  Future<void> updateString(int id, String myString) async {
    final db = await database;
    await db.update(
      'my_table',
      {'my_string': myString},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a string from the database
  Future<void> deleteString(int id) async {
    final db = await database;
    await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
