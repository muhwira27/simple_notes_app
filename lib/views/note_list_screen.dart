import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/controllers/notes_controllers.dart';
import 'package:simple_notes_app/views/new_note_screen.dart';
import 'package:simple_notes_app/widgets/note_tile.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotesController notessController = Get.put(NotesController());

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          "N O T E S",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Obx(
          () => notessController.isLongPress.value
              ? IconButton(
                  onPressed: notessController.onCloseCheck,
                  icon: Icon(Icons.close),
                  iconSize: 30,
                )
              : Container(),
        ),
        actions: [
          Obx(
            () => notessController.isLongPress.value
                ? IconButton(
                    onPressed: notessController.deleteSelectedNotes,
                    icon: Icon(Icons.delete),
                    iconSize: 30,
                  )
                : Container(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Stack(
          children: [
            Obx(
              () => ListView.builder(
                itemCount: notessController.noteList.length,
                itemBuilder: (context, index) {
                  final note = notessController.noteList[index];
                  return NoteTile(
                    title: note[0],
                    description: note[1],
                    date: note[2],
                    editIndex: index,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 50,
              right: 12,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(
                    () => NewNoteScreen(
                      titleController: TextEditingController(),
                      descriptionController: TextEditingController(),
                      onEdit: false,
                    ),
                  );
                },
                backgroundColor: Colors.deepOrange,
                child: Icon(
                  Icons.add,
                  color: Colors.white70,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
