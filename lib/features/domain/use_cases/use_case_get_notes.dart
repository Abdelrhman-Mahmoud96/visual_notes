import 'package:dartz/dartz.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/core/usecases/use_case_with_stream.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';


class UseCaseGetNotes implements UseCaseWithStream<List<Note>, NoParams>{
  UseCaseGetNotes({required this.noteRepository});

  final NoteRepository? noteRepository;

  @override
  Stream<Either<Failure,List<Note>>> call(NoParams noParams) async*{
     yield* noteRepository!.getNotesFromDatabase();
  }

}
