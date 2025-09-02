import 'package:sqflite/sqflite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ticketsales/core/errors/opening_database_error.dart';

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
    db_instance = await openDatabase(database_url);

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