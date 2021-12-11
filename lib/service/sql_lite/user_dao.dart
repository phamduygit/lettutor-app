import 'package:lettutor_app/models/user.dart';
import 'package:lettutor_app/service/sql_lite/favorite_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDAO {
  final String databaseName = 'user.db';
  Database? db;
  Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id TEXT PRIMARY KEY, fullName TEXT, avatar TEXT, email TEXT)',
        );
      },
    );
  }

// 'CREATE TABLE users(id STRING PRIMARY KEY, avatar STRING, fullName STRING, email STRING)',
  Future<void> insert(User user) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'id = ?', whereArgs: [user.id]);
    if (maps.isEmpty) {
      await db!.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await db!.close();
  }

  Future<bool> isNotExists(User user) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'id = ?', whereArgs: [user.id]);
    if (maps.isEmpty) {
      return true;
    }
    return false;
  }

  Future<User> getUser(String userID) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'id = ?', whereArgs: [userID]);
    List<String> favorites = [];
    if (maps.isNotEmpty) {
      favorites = await FavoriteDAO().listTeacherID(maps[0]["id"]);
    }
    await db!.close();
    return User(
      favorites: favorites,
      id: maps[0]["id"],
      fullName: maps[0]["fullName"],
      email: maps[0]["email"],
      avatar: maps[0]["avatar"],
    );
  }
}
