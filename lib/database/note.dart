import 'package:floor/floor.dart';

@Entity(tableName: 'notes')
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String title;
  String text;

  Note(this.title, this.text, {this.id});
}
