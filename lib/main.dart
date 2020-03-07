import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarea_dos/home/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/todo_remainder.dart';

void main() async {
  // TODO: inicializar hive y agregar el adapter
  WidgetsFlutterBinding.ensureInitialized();
  final appPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appPath.path);
  Hive.registerAdapter(TodoRemainderAdapter());
  await Hive.openBox('toDoBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.grey[50],
      ),
      home: HomePage(),
    );
  }
}
