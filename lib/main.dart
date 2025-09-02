import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ticketsales/features/sale_form/sale_form_screen.dart';

void main() async {
  debugPrint("-------------");
  debugPrint("STARTING APP");
  debugPrint("-------------");

  debugPrint("Opening .env 0/1");
  await dotenv.load(fileName: ".env");
  debugPrint(".env Opened 1/1");

  runApp((const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SalePage(),
    );
  }
}