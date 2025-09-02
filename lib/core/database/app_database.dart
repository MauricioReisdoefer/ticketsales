import 'package:sqflite/sqflite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Database> getDatabase() async {
  final String? database_url = dotenv.get("DATABASE_URL");
  if(database_url == null)
  {
    
  }
  final Database db = await openDatabase("");
}