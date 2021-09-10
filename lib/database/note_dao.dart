import 'package:floor/floor.dart';
import 'package:note/database/note.dart';

@dao
abstract class NoteDao {
  @Query("SELECT * FROM notes")
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> insertNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @delete
  Future<void> deleteAllNotes(List<Note> notes);
}
