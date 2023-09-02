import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_notes_app/views/note_list_screen.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box called 'notesBox'
  await Hive.openBox('notesBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IBMPlex',
        brightness: Brightness.dark,
      ),
      home: NoteListScreen(),
    );
  }
}
