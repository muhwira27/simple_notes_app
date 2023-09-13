import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class NotesController extends GetxController {
  final _notesBox = Hive.box('notesBox');
  var noteList = [].obs;
  DateFormat dateFormat = DateFormat();

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting();
    dateFormat = DateFormat('d MMMM HH:mm', 'id');
    loadData();
  }

  void loadData() {
    noteList.assignAll(_notesBox.get('NOTELIST') ?? []);
  }

  void updateData() {
    _notesBox.put('NOTELIST', noteList);
  }

  void saveNewNote(String title, String description) {
    if (title.isNotEmpty || description.isNotEmpty) {
      noteList.insert(0, [
        title,
        description,
        dateFormat.format(DateTime.now()),
      ]);
      updateData();
    }
  }

  @override
  void onClose() {
    updateData();
    super.onClose();
  }
}
