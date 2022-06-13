import 'package:dartz/dartz.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/domain/entities/note.dart';


abstract class NoteRepository{
  Stream<Either<Failure,List<Note>>> getNotesFromDatabase();
  Future<Either<Failure,String>> addNoteToDatabase({required Note note});
  Future<Either<Failure,String>> updateNoteInDatabase({required Note note});
  Future<Either<Failure,String>> deleteNoteFromDatabase({required Note note});
}
