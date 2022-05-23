import 'package:visual_notes/domain/entities/note.dart';


abstract class NoteRepository{
  Stream<List<Note>> getNotesFromDatabase();
  Future<void> addNoteToDatabase(Note note);
  Future<void> updateNoteInDatabase(Note note);
  Future<void> deleteNoteFromDatabase(Note note);
}
