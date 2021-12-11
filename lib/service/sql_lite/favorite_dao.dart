import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Favorite {
  String id;
  String userID;
  String teacherID;
  Favorite({
    required this.id,
    required this.userID,
    required this.teacherID,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'teacherID': teacherID,
    };
  }
}

class FavoriteDAO {
  final String databaseName = "users.db";
  Future<Database> open() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE favorites(id TEXT PRIMARY KEY, userID TEXT, teacherID TEXT)',
        );
      },
    );
    return db;
  }

  Future<void> insert(Favorite favorite) async {
    Database db = await open();
    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
  }

  Future<void> delete(String userID, String teacherID) async {
    Database db = await open();
    final List<Map<String, dynamic>> maps =
        await db.query('favorites', where: 'userID = ?', whereArgs: [userID]);
    final favorite =
        maps.firstWhere((element) => element['teacherID'] == teacherID);
    await db.delete('favorites', where: 'id = ?', whereArgs: [favorite["id"]]);
  }

  Future<List<String>> listTeacherID(String userID) async {
    Database db = await open();
    final List<Map<String, dynamic>> maps =
        await db.query('favorites', where: 'userID = ?', whereArgs: [userID]);
    return List.generate(maps.length, (index) {
      return maps[index]['teacherID'];
    });
  }
}
