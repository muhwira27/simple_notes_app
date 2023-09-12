import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  NoteTile({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
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

            //description
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
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
