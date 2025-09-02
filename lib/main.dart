import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  debugPrint("-------------");
  debugPrint("STARTING APP");
  debugPrint("-------------");

  debugPrint("Opening .env 0/1");
  await dotenv.load(fileName: ".env");
  debugPrint(".env Opened 1/1");
}