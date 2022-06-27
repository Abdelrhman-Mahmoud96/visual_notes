import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:visual_notes/core/errors/exceptions.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/data/database/app_database.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';


class NoteDatabaseRepository implements INoteRepository{
  NoteDatabaseRepository({required this.database});

  final AppDatabase? database;

  @override
  Stream<Either<Failure,List<Note>>> getNotesFromDatabase()
  async*{
    final result = database!.noteDao.getNotes();
    yield* result
        .map((notes) => right<Failure, List<Note>>(notes))
        .onErrorReturnWith((error,_) => left(
      StorageFailure(storageFailureMessage: 'GET_NOTES_FAILED with $error',),),
    );
  }

  @override
  Future<Either<Failure,String>> addNoteToDatabase({required Note note})
  async{
    try {
      await database!.noteDao.addNote(note);
      return const Right('ADD_NOTE_SUCCESS');
    } on StorageException {
      return Left(StorageFailure(storageFailureMessage: 'ADD_NOTE_FAILED'));
    }
  }

  @override
  Future<Either<Failure,String>> deleteNoteFromDatabase({required Note note})
  async{
    try {
      await database!.noteDao.deleteNote(note);
      return const Right('DELETE_NOTE_SUCCESS');
    } on StorageException {
      return Left(StorageFailure(storageFailureMessage: 'DELETE_NOTE_FAILED'));

    }
  }

  @override
  Future<Either<Failure,String>> updateNoteInDatabase({required Note note})
  async{
    try {
      await database!.noteDao.updateNote(note);
    return const Right('UPDATE_NOTE_SUCCESS');
    } on StorageException {
    return Left(StorageFailure(storageFailureMessage: 'UPDATE_NOTE_FAILED'));
    }
  }
}
