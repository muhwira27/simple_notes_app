import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewNoteScreen extends StatelessWidget {
  final titleController;
  final descriptionController;

  NewNoteScreen({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat();
    dateFormat = DateFormat('d MMMM HH:mm');

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                dateFormat.format(DateTime.now()),
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
