import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pas_mobile_11pplg1_08/model/store_model.dart';

class CartDB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'cart.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            image TEXT
          )
        ''');
      },
    );
  }

  static Future<void> addToCart(Store item) async {
    final db = await database;

    final check = await db.query('cart', where: 'id = ?', whereArgs: [item.id]);

    if (check.isEmpty) {
      await db.insert('cart', {
        'id': item.id,
        'title': item.title,
        'price': item.price,
        'image': item.image,
      });
    }
  }

  static Future<List<Map<String, dynamic>>> getCart() async {
    final db = await database;
    return db.query('cart');
  }

  static Future<void> removeItem(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
