import 'package:flutter_test/flutter_test.dart';
import 'package:ticketsales/core/database/app_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  group('AppDatabase Tests', () {
    late AppDatabase appDatabase;

    setUp(() {
      appDatabase = AppDatabase();
    });

    test('Open database successfully', () async {
      try {
        await appDatabase.getDatabase();
        expect(appDatabase.db_instance, isNotNull);
      } catch (e) {
        fail('Opening database failed: $e');
      }
    });

    test('Close database successfully', () async {
      await appDatabase.getDatabase();

      try {
        await appDatabase.closeDatabase();
        expect(appDatabase.db_instance!.isOpen, isFalse);
      } catch (e) {
        fail('Closing database failed: $e');
      }
    });
  });
}
