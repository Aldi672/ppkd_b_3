// ignore_for_file: depend_on_referenced_packages

import 'package:path/path.dart';
import 'package:ppkd/data/data_peserta.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('peserta.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2, // 👉 versi dinaikkan
      onCreate: _createDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // kolom baru ditambahkan di sini
          await db.execute("ALTER TABLE peserta ADD COLUMN phone INTEGER");
          await db.execute("ALTER TABLE peserta ADD COLUMN password TEXT");
          await db.execute("ALTER TABLE peserta ADD COLUMN confirm TEXT");
        }
      },
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE peserta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        email TEXT NOT NULL,
        event TEXT NOT NULL,
        kota TEXT NOT NULL,
        phone INTEGER,
        password TEXT NOT NULL,
        confirm TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertPeserta(Peserta peserta) async {
    final db = await instance.database;
    return await db.insert('peserta', peserta.toMap());
  }

  Future<List<Peserta>> getAllPeserta() async {
    final db = await instance.database;
    final result = await db.query('peserta');
    return result.map((map) => Peserta.fromMap(map)).toList();
  }

  static Future<void> updatePeserta(Peserta peserta) async {
    final db = await instance.database;
    await db.update(
      'peserta',
      peserta.toMap(),
      where: 'id = ?',
      whereArgs: [peserta.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deletePeserta(int id) async {
    final db = await instance.database;
    await db.delete('peserta', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> removeLoginFromDatabase(int id) async {
    final db = await instance.database;
    await db.delete('peserta', where: 'id = ?', whereArgs: [id]);
  }
}
