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
      backgroundColor: Colors.black,
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
                : Row(
                    children: [
                      IconButton(
                        icon: Icon(notessController.ascending.value
                            ? Icons.arrow_upward
                            : Icons.arrow_downward),
                        onPressed: notessController.ascDesc,
                      ),
                      PopupMenuButton<String>(
                        shadowColor: Colors.black,
                        icon: Icon(Icons.sort_rounded),
                        iconSize: 30,
                        offset: Offset(0.0, AppBar().preferredSize.height),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onSelected: (value) {
                          notessController.sortBy(value);
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            enabled: false,
                            child: Text(
                              'Sort by',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          PopupMenuItem(value: 'title', child: Text('Title')),
                          PopupMenuItem(value: 'date', child: Text('Date')),
                        ],
                      )
                    ],
                  ),
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
