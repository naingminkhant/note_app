import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/database/note.dart';
import 'package:note/database/note_dao.dart';

class EditNote extends StatelessWidget {
  final NoteDao _noteDao = Get.find();
  TextEditingController _title = TextEditingController();
  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Note _note = Get.arguments;
    _title.text = _note.title;
    _text.text = _note.text;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: Container(
        child: Container(
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
                    _noteDao.updateNote(
                        Note(_title.text, _text.text, id: _note.id));
                    Get.back();
                  },
                  child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
