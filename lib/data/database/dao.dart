import 'package:floor/floor.dart';
import 'package:visual_notes/data/database/database_constants.dart';
import 'package:visual_notes/domain/entities/note.dart';



@dao
abstract class NoteDao{

  @Query('SELECT * FROM $kTableName')
  Stream<List<Note>> getNotes();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addNote(Note note);

  @update
  Future<void> updateNote(Note note);

  //we could have used query to delete with the note id only
  @delete
  Future<void> deleteNote(Note note);
}
