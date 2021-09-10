import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/database/note.dart';
import 'package:note/database/note_dao.dart';

class CreateNote extends StatelessWidget {
  final NoteDao _noteDao = Get.find();
  TextEditingController _title = TextEditingController();
  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: _title,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Text'),
              controller: _text,
            ),
            ElevatedButton(
                onPressed: () {
                  _noteDao.insertNote(Note(_title.text, _text.text));
                  Get.back();
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
