import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/controllers/notes_controllers.dart';

class NewNoteScreen extends StatelessWidget {
  final titleController;
  final descriptionController;
  final bool? onEdit;
  final int? editIndex;

  NewNoteScreen({
    super.key,
    required this.titleController,
    required this.descriptionController,
    this.onEdit,
    this.editIndex,
  });

  @override
  Widget build(BuildContext context) {
    final NotesController notessController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                if (onEdit!) {
                  notessController.editNote(
                    editIndex!,
                    titleController.text,
                    descriptionController.text,
                  );
                } else {
                  notessController.saveNewNote(
                    titleController.text,
                    descriptionController.text,
                  );
                }
                Get.back();
              },
              icon: Icon(
                Icons.check,
                size: 30,
                color: Colors.yellow[800],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            // Title text field
            TextField(
              controller: titleController,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.white38,
                  ),
                  border: InputBorder.none),
            ),

            // Date
            Container(
              alignment: Alignment.topLeft,
              height: 20,
              child: Text(
                notessController.dateFormat.format(DateTime.now()),
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
            ),

            // Description text field
            TextField(
              controller: descriptionController,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.7,
              ),
              minLines: 1,
              maxLines: 1000,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(fontSize: 16, color: Colors.white38),
                border: InputBorder.none,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
