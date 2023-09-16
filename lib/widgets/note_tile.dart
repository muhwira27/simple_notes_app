import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:simple_notes_app/controllers/notes_controllers.dart';
import 'package:simple_notes_app/views/new_note_screen.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final int editIndex;

  NoteTile({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.editIndex,
  });

  @override
  Widget build(BuildContext context) {
    final NotesController notessController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => NewNoteScreen(
              titleController: TextEditingController(text: title),
              descriptionController: TextEditingController(text: description),
              onEdit: true,
              editIndex: editIndex,
            ),
          );
        },
        onLongPress: notessController.onLongPress,
        child: Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // description
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),

                    // date
                    Text(
                      date,
                      style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              Obx(
                () => SizedBox(
                  width: 30,
                  height: 30,
                  child: notessController.isLongPress.value
                      ? RoundCheckBox(
                          size: 30,
                          uncheckedColor: Colors.grey.shade600,
                          checkedColor: Colors.deepOrange,
                          isChecked: notessController.selectedNotes
                              .contains(editIndex),
                          onTap: (value) =>
                              notessController.onSelectNote(value, editIndex),
                          animationDuration: Duration(microseconds: 300),
                        )
                      : Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
