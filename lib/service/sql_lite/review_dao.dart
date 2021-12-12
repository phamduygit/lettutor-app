import 'package:intl/intl.dart';
import 'package:lettutor_app/models/review.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class ReviewDAO {
  Database? db;
  Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'review.db'),
      version: 2,
      onCreate: (db, version) {
        
        return db.execute(
            'CREATE TABLE reviews(id TEXT PRIMARY KEY, userID TEXT, teacherID TEXT, comment TEXT, avatar TEXT, numberOfStar INTEGER, date TEXT, username TEXT)');
      },
    );
  }

  Future<void> insert(Review review) async {
    await open();
    await db!.insert('reviews', review.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db!.close();
  }

  Future<void> update(Review review) async {
    await open();
    await db!.update('reviews', review.toMap(),
        where: 'id = ?', whereArgs: [review.id]);
    await db!.close();
  }

  Future<List<Review>> getListReivew() async {
    await open();
    final List<Map<String, dynamic>> maps = await db!.query('reviews');
    await db!.close();
    return List.generate(
      maps.length,
      (index) => Review(
        id: maps[index]["id"],
        userID: maps[index]["userID"],
        teacherID: maps[index]["teacherID"],
        comment: maps[index]["comment"],
        avatar: maps[index]["avatar"],
        numberOfStar: maps[index]["numberOfStar"],
        date: DateFormat("dd/MM/yyyy HH:mm:ss").parse(maps[index]["date"]),
        username: maps[index]["username"],
      ),
    );
  }
}
