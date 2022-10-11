// import 'dart:io';

// import 'package:app_flutter_thientin/src/login/models/user_local.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// late Database db;

// class DatabaseCreator {
//   static const userTable = 'user';
//   static const phone = 'phone';
//   static const pass = 'pass';
//   static const token = 'token';
//   static const isDeleted = 'isDeleted';

//   static void databaseLog(String functionName, String sql,
//       [List<Map<String, dynamic>>? selectQuery, int? insertAndUpdateQuery]) {
//     print(functionName);
//     print(sql);
//     if (selectQuery != null) {
//       print(selectQuery);
//     } else if (insertAndUpdateQuery != null) {
//       print(insertAndUpdateQuery);
//     }
//   }

//   Future<void> createUserTable(Database db) async {
//     const userSql = '''CREATE TABLE $userTable
//     (
//       $phone TEXT,
//       $pass TEXT,
//       $token TEXT,
//       $isDeleted BIT NOT NULL
//     )''';
//     await db.execute(userSql);
//   }

//   Future<String> getDatabasePath(String dbName) async {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, dbName);

//     if (await Directory(dirname(path)).exists()) {
//       await deleteDatabase(path);
//     } else {
//       await Directory(dirname(path)).create(recursive: true);
//     }
//     return path;
//   }

//   Future<void> initDatabase() async {
//     final path = await getDatabasePath('user_db');
//     db = await openDatabase(path, version: 1, onCreate: onCreate);
//   }

//   Future<void> onCreate(Database db, int version) async {
//     await createUserTable(db);
//   }
// }

// class DatabaseRepositoryUser {
//   static Future<List<UserLocal>> getAllUser() async {
//     const sql = '''SELECT * FROM ${DatabaseCreator.userTable}
//     WHERE ${DatabaseCreator.isDeleted} == 0''';
//     final data = await db.rawQuery(sql);

//     List<UserLocal> users = [];

//     for (final node in data) {
//       final user = UserLocal.fromLocal(node);
//       users.add(user);
//     }
//     return users;
//   }

//   static Future<void> addUser(UserLocal user) async {
//     dynamic sql = '''INSERT INTO ${DatabaseCreator.userTable}
//     (
//       ${DatabaseCreator.phone},
//       ${DatabaseCreator.pass},
//       ${DatabaseCreator.token},
//       ${DatabaseCreator.isDeleted},
//     )
//     VALUES
//     (
//       ${user.phone},
//       ${user.pass},
//       ${user.token},
//       ${user.isDeleted ? 1 : 0},
//     )''';

//     final result = await db.rawInsert(sql);
//     DatabaseCreator.databaseLog('Add user', sql, null, result);
//   }

//   static Future<void> deleteUser(UserLocal user) async {
//     dynamic sql = '''UPDATE ${DatabaseCreator.userTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.phone} == ${user.phone}
//     ''';

//     final result = await db.rawInsert(sql);
//     DatabaseCreator.databaseLog('Add user', sql, null, result);
//   }

//   static Future<void> updateUser(UserLocal user) async {
//     dynamic sql = '''UPDATE ${DatabaseCreator.userTable}
//     SET ${DatabaseCreator.token} = "${user.token}"
//     WHERE ${DatabaseCreator.phone} = "${user.phone}"
//     ''';

//     final result = await db.rawUpdate(sql);
//     DatabaseCreator.databaseLog('Update user', sql, null, result);
//   }
// }
