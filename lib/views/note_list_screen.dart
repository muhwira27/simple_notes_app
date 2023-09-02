import 'package:flutter/material.dart';

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
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
            Positioned(
              bottom: 50,
              right: 12,
              child: FloatingActionButton(
                onPressed: () {},
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
