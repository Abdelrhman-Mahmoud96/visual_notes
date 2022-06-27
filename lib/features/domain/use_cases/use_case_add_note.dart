import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';

@dev
@singleton
class UseCaseAddNote implements IUseCase<String, Note>{
  UseCaseAddNote({required this.noteRepository});

  final INoteRepository? noteRepository;

  @override
  Future<Either<Failure,String>> call(Note prams) async =>
      noteRepository!.addNoteToDatabase(note: prams);




}
