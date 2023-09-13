import 'package:flutter/material.dart';
import 'package:simple_notes_app/views/new_note_screen.dart';
import 'package:simple_notes_app/widgets/note_tile.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return NoteTile(
                  title: 'Title',
                  description: 'Description',
                  date: '12 September 21.00',
                );
              },
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
