import 'package:injectable/injectable.dart';
import 'package:visual_notes/domain/entities/note.dart';
import 'package:visual_notes/domain/repository/note_repository.dart';
import 'package:visual_notes/domain/use_cases/use_case_with_stream.dart';

@dev
@singleton
class UseCaseGetNotes implements UseCaseWithStream<List<Note>, void>{
  UseCaseGetNotes({required this.noteRepository});

  final NoteRepository? noteRepository;

  @override
  Stream<List<Note>> call(void noPrams) {
    return noteRepository!.getNotesFromDatabase();
  }
}
