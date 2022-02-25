import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}