import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tablaPlantas = 'plantas';
final String columnId = '_id';
final String columnNombre = 'nombre';
final String columnUbicacion = 'ubicacion';
final String columndiasRegado = 'diasRegado';

class Plant {
  int id;
  String nombre;
  String ubicacion;
  int diasRegado;

  Plant();

  Plant.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    nombre = map[columnNombre];
    ubicacion = map[columnUbicacion];
    diasRegado = map[columndiasRegado];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nombre': nombre,
      'ubicacion': ubicacion,
      'diasRegado': diasRegado
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'nombre: $nombre, ubicacion: $ubicacion, diasRegado: $diasRegado';
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "Plants.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tablaPlantas (
                $columnId INTEGER PRIMARY KEY,
                $columnNombre TEXT NOT NULL,
                $columnUbicacion TEXT NOT NULL,
                $columndiasRegado INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Plant plant) async {
    Database db = await database;
    int id = await db.insert(tablaPlantas, plant.toMap());
    return id;
  }

  Future<Plant> queryPlant(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablaPlantas,
        columns: [columnId, columnNombre, columnUbicacion, columndiasRegado],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Plant.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Plant>> queryAllPlants() async {
    Database db = await database;
    List<Map> maps = await db.query(tablaPlantas);
    if (maps.length > 0) {
      List<Plant> plants = [];
      maps.forEach((map) => plants.add(Plant.fromMap(map)));
      return plants;
    }
    return null;
  }

  Future<int> deletePlant(int id) async {
    Database db = await database;
    return await db
        .delete(tablaPlantas, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteAllPlants() async {
    Database db = await database;
    return await db.delete(tablaPlantas);
  }

  Future<int> update(Plant plant) async {
    Database db = await database;
    return await db.update(tablaPlantas, plant.toMap(),
        where: '$columnId = ?', whereArgs: [plant.id]);
  }
}
