import 'package:visual_notes/data/database/app_database.dart';
import 'package:visual_notes/domain/entities/note.dart';
import 'package:visual_notes/domain/repository/note_repository.dart';


class NoteDatabaseRepository implements NoteRepository{
  NoteDatabaseRepository({required this.database});

  final AppDatabase? database;

  @override
  Future<void> addNoteToDatabase(Note note){
    return database!.noteDao.addNote(note);
  }

  @override
  Future<void> deleteNoteFromDatabase(Note note) {
    return database!.noteDao.deleteNote(note);
  }

  @override
  Stream<List<Note>> getNotesFromDatabase() {
    return database!.noteDao.getNotes();
  }

  @override
  Future<void> updateNoteInDatabase(Note note) {
    return database!.noteDao.updateNote(note);
  }

}
