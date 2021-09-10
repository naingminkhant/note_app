import 'dart:async';
import 'package:floor/floor.dart';
import 'package:note/database/note.dart';
import 'package:note/database/note_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
