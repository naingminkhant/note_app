import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/database/note.dart';
import 'package:note/database/note_dao.dart';
import 'package:note/screen/note/create.dart';
import 'package:note/screen/note/edit.dart';

@immutable
class NoteList extends StatelessWidget {
  final NoteDao _noteDao = Get.find();
  List<Note> _notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: notePart(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'create',
            onPressed: () {
              Get.to(() => CreateNote());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _noteDao.deleteAllNotes(_notes);
            },
            heroTag: 'delete',
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget notePart() {
    return StreamBuilder<List<Note>>(
      stream: _noteDao.getAllNotes(),
      builder: (_, data) {
        _notes = data.data!;
        return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Get.to(() => EditNote(), arguments: data.data![index]);
                    },
                    icon: Icon(Icons.edit),
                  ),
                  title: Text(data.data![index].title),
                  subtitle: Text(data.data![index].text),
                  trailing: IconButton(
                      onPressed: () {
                        _noteDao.deleteNote(data.data![index]);
                      },
                      icon: Icon(Icons.delete)),
                ),
              );
            });
      },
    );
  }
}
