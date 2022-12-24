import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE carts(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
          nama TEXT, 
          gambar TEXT, 
          harga int, 
          jumlah int, 
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          )
          """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sb.db',
      version: 1,
      onCreate: (sql.Database database, version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      String nama, String gambar, String harga, String jumlah) async {
    final db = await SQLHelper.db();
    final data = {
      'nama': nama,
      'gambar': gambar,
      'harga': harga,
      'jumlah': jumlah
    };
    final id = await db.insert('carts', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    final items = db.query('carts', orderBy: "id");
    print(items);
    return items;
  }
}
