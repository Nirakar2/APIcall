import 'dart:io';
import 'package:apicallshowinlistview/MODEL/LIST_VIEW_WITH_API_MODEL/listviewwithapi_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ListViewDatabase {
  static const _dbVersion = 1;
  // database name
  static const _dbName = 'listviewdata';

  //Table Name Decleration
  static const tableName = "listview_info";

  //Table heading Name
  static const columnName0 = "ID";
  static const columnName1 = "MeetingID";
  static const columnName2 = "PassCode";
  static const columnName3 = "URL";
  static const columnName4 = "RoomID";
  static const columnName5 = "CreatedDate";
  static const columnName6 = "SchoolID";
  static const columnName7 = "Userid";
  static const columnName8 = "IsActive";
  static const columnName9 = "classID";
  static const columnName10 = "SectionID";
  static const columnName11 = "ClassName";
  static const columnName12 = "SectionName";
  static const columnName13 = "subjectID";
  static const columnName14 = "SubjectName";
  static const columnName15 = "TeacherName";
  static const columnName16 = "MeetingType";
  // defined for DB helper
  ListViewDatabase._privateConstructor();
  static final ListViewDatabase instance =
      ListViewDatabase._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initiateDatabase();
    return _database;
  }

  late String path;
  initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    // Create Table and Column
    await db.execute(''' CREATE TABLE if not exists $tableName(
                                                $columnName0 INTEGER PRIMARY KEY,
                                                $columnName1 TEXT,                                  
                                                $columnName2 TEXT,
                                                $columnName3 TEXT,
                                                $columnName4 TEXT,
                                                $columnName5 TEXT,
                                                $columnName6 TEXT,
                                                $columnName7 TEXT,
                                                $columnName8 TEXT,
                                                $columnName9 TEXT,
                                                $columnName10 TEXT,
                                                $columnName11 TEXT,
                                                $columnName12 TEXT,
                                                $columnName13 TEXT,
                                                $columnName14 TEXT,
                                                $columnName15 TEXT,
                                                $columnName16 TEXT) ''');
  }

  Future<dynamic> insertAllListViewData(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(tableName, row);
  }

  Future<dynamic> deleteAllData() async {
    Database? db = await instance.database;
    return await db!.rawDelete('''Delete from $tableName''');
  }

  Future<List<ZoomMeetingDetails>> getAllData() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> data = await db!.query(tableName);
    return data.map((e) => ZoomMeetingDetails.fromJson(e)).toList();
  }
}
