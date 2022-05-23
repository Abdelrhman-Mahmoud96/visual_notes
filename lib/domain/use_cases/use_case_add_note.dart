import 'package:injectable/injectable.dart';
import 'package:visual_notes/domain/entities/note.dart';
import 'package:visual_notes/domain/repository/note_repository.dart';
import 'package:visual_notes/domain/use_cases/use_case.dart';

@dev
@singleton
class UseCaseAddNote implements UseCase<void, Note>{
  UseCaseAddNote({required this.noteRepository});

  final NoteRepository? noteRepository;

  @override
  Future<void> call(Note prams) => noteRepository!.addNoteToDatabase(prams);

}
