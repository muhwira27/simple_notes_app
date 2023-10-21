import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_notes_app/views/note_list_screen.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box called 'notesBox'
  await Hive.openBox('notesBox');

  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 480.0,
    app: MyApp(),
  );

  runApp(runnableApp);
}

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }

  return Center(
    child: ClipRect(
      child: SizedBox(
        width: webAppWidth,
        child: app,
      ),
    ),
  );
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
