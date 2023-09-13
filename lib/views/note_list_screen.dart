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
                  );
                },
              ),
            ),
            Positioned(
              bottom: 50,
              right: 12,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewNoteScreen(
                        titleController: TextEditingController(),
                        descriptionController: TextEditingController(),
                      ),
                    ),
                    (route) => true,
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
