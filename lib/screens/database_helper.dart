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
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // Initialize database factory if needed (for some platforms)
    // await Sqflite.devSetDebugModeOn(true); // Optional for debugging

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: (db) async {
        // Add any database configuration here if needed
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id TEXT PRIMARY KEY,
        image TEXT,
        title TEXT,
        description TEXT,
        rating REAL,
        price REAL,
      )
    ''');
  }

// ... rest of your methods remain the same ...


  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('products', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    final products = await db.query('products');
    print("Retrieved ${products.length} products from database");
    return products;
  }

  Future<int> clearProducts() async {
    final db = await database;
    return await db.delete('products');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}