import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class NotesController extends GetxController {
  final _notesBox = Hive.box('notesBox');
  var noteList = [].obs;
  var selectedNotes = <int>[].obs;
  var isLongPress = false.obs;
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

  void editNote(int index, String title, String description) {
    if (index >= 0 && index < noteList.length) {
      noteList[index] = [
        title,
        description,
        dateFormat.format(DateTime.now()),
      ];
      updateData();
    }
  }

  void onLongPress() {
    isLongPress.value = true;
  }

  void onCloseCheck() {
    isLongPress.value = false;
    selectedNotes.clear();
  }

  void onSelectNote(bool? value, int index) {
    if (value!) {
      selectedNotes.add(index);
    } else {
      selectedNotes.remove(index);
    }
  }

  void deleteSelectedNotes() {
    selectedNotes.sort((a, b) => b.compareTo(a));
    for (var index in selectedNotes) {
      if (index >= 0 && index < noteList.length) {
        noteList.removeAt(index);
      }
    }
    updateData();
    selectedNotes.clear();
    isLongPress.value = false;
  }

  @override
  void onClose() {
    updateData();
    super.onClose();
  }
}
