import 'package:sqflite/sqflite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ticketsales/core/errors/opening_database_error.dart';
import 'package:flutter/material.dart';

class AppDatabase {
  Database? db_instance;

  AppDatabase();

  Future<void> getDatabase() async {
    final String? database_url = dotenv.get("DATABASE_URL");
    if(database_url == null)
    {
      throw new OpeningDatabaseError(".env file needs 'DATABASE_URL' field");
    }

    if(db_instance != null){
      throw new OpeningDatabaseError("Database is already open");
    }
    db_instance = await openDatabase(
      database_url,
      version: 1,
      onCreate: (Database db, int version) async {
        debugPrint("---------------------------");
        debugPrint("Creating Database 0/3");
        await db.execute('PRAGMA foreign_keys = ON');
        debugPrint("Foreign Keys permited 1/3");
        
        debugPrint("Events table created 2/3");
        await db.execute('''
            CREATE TABLE events (
              id INTEGER PRIMARY KEY, 
              name TEXT, 
              max_ammount INTEGER
            )
        ''');

        await db.execute('''
            CREATE TABLE sales (
              id INTEGER PRIMARY KEY, 
              name TEXT, 
              ammount INTEGER,
              date TEXT,
              event_id INTEGER,
              FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
            )
        ''');
        debugPrint("Sales table created 3/3");
        debugPrint("---------------------------");
      }
    );
  }

  Future<void> closeDatabase() async {
    final String? database_url = dotenv.get("DATABASE_URL");
    if(database_url == null)
    {
      throw new OpeningDatabaseError(".env file needs 'DATABASE_URL' field");
    }
    if(db_instance == null)
    {
      throw new OpeningDatabaseError("Database is already closed");
    }
    await db_instance!.close();
    }
}
