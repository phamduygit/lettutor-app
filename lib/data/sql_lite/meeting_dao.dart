// import 'package:intl/intl.dart';
// import 'package:lettutor_app/models/meeting.dart';
// import 'package:sqflite/sqflite.dart';
// // import 'package:sqflite/sqlite_api.dart';
// import 'package:path/path.dart';

// class MeetingDAO {
//   final String databaseName = 'meetings.db';
//   Database? db;
//   Future<void> open() async {
//     db = await openDatabase(
//       join(await getDatabasesPath(), databaseName),
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//             'CREATE TABLE meetings(id TEXT PRIMARY KEY, userID TEXT, teacherID TEXT, avatar TEXT, name TEXT, date TEXT, status INTEGER)');
//       },
//     );
//   }

//   Future<void> close() async {
//     db!.close();
//   }

//   Future<void> insertMeeting(Meeting meeting) async {
//     await open();
//     await db!.insert(
//       'meetings',
//       meeting.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     await close();
//   }

//   Future<void> deleteMeeting(Meeting meeting) async {
//     await open();
//     await db!.delete('meetings', where: 'id = ?', whereArgs: [meeting.id]);
//     await close();
//   }

//   Future<List<Meeting>> getListMeeting(String userID) async {
//     await open();
//     final List<Map<String, dynamic>> maps =
//         await db!.query('meetings', where: 'userID = ?', whereArgs: [userID]);
//     await close();
//     return List.generate(
//       maps.length,
//       (index) => Meeting(
//         id: maps[index]["id"],
//         userID: maps[index]["userID"],
//         teacherID: maps[index]["teacherID"],
//         avatar: maps[index]["avatar"],
//         name: maps[index]["name"],
//         date: DateFormat("dd/MM/yyyy HH:mm:ss").parse(maps[index]["date"]),
//         status: maps[index]["status"],
//       ),
//     );
//   }
// }
