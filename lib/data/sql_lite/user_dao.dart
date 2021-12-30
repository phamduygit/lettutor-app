
import 'package:intl/intl.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:lettutor_app/data/sql_lite/favorite_dao.dart';
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
          //id, fullName, avatar, email, country, phone, birthday, target, level
          'CREATE TABLE users(id TEXT PRIMARY KEY, fullName TEXT, avatar TEXT, email TEXT, country TEXT, phone TEXT, birthday TEXT, target TEXT, level TEXT)',
        );
      },
    );
  }

  Future<void> close() async {
    db!.close();
  }
  Future<void> insert(UserProvider user) async {
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
  Future<void> update(UserProvider user) async {
    await open();
    await db!.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    // db!.close();
  }
  Future<bool> isNotExists(UserProvider user) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'email = ?', whereArgs: [user.email]);
    if (maps.isEmpty) {
      return true;
    }
    await db!.close();
    return false;
  }

  Future<UserProvider> getUserByEmail(String email) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'email = ?', whereArgs: [email]);
    List<String> favorites = [];
    if (maps.isNotEmpty) {
      favorites = await FavoriteDAO().listTeacherID(maps[0]["id"]);
    }
    await db!.close();
    return UserProvider(
      favorites: favorites,
      id: maps[0]["id"],
      fullName: maps[0]["fullName"],
      email: maps[0]["email"],
      avatar: maps[0]["avatar"],
      country: maps[0]["country"],
      phone: maps[0]["phone"],
      birthDay: DateFormat("dd/MM/yyyy HH:mm:ss").parse(maps[0]["birthday"]),
      target: maps[0]["target"].split(" "),
      level: maps[0]["level"],
    );
  }

  Future<UserProvider> getUserById(String id) async {
    await open();
    final List<Map<String, dynamic>> maps =
        await db!.query('users', where: 'id = ?', whereArgs: [id]);
    List<String> favorites = [];
    if (maps.isNotEmpty) {
      favorites = await FavoriteDAO().listTeacherID(maps[0]["id"]);
    }
    await db!.close();
    return UserProvider(
      favorites: favorites,
      id: maps[0]["id"],
      fullName: maps[0]["fullName"],
      email: maps[0]["email"],
      avatar: maps[0]["avatar"],
      country: maps[0]["country"],
      phone: maps[0]["phone"],
      birthDay: DateFormat("dd/MM/yyyy HH:mm:ss").parse(maps[0]["birthday"]),
      target: maps[0]["target"].split("-"),
      level: maps[0]["level"],
    );
  }
}
