import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';

class MockNoteRepository extends Mock implements NoteRepository{}
class FakeNote extends Fake implements Note{}

void main(){
  UseCaseUpdateNote? useCaseUpdateNote;
  MockNoteRepository? mockNoteRepository;
  FakeNote? fakeNote;
  const tSuccessString = 'success';
  final tNote = Note(
    id: '1',
    title:'test',
    imageData: '',
    description: 'test',
    date: DateTime.now(),);

  setUp((){
    mockNoteRepository = MockNoteRepository();
    useCaseUpdateNote = UseCaseUpdateNote(noteRepository: mockNoteRepository);
    fakeNote = FakeNote();
    registerFallbackValue(fakeNote);
  });

  test(
      'should pass note to repository to update it using updateNoteInDatabase',
          () async{
        when(() => mockNoteRepository!
            .updateNoteInDatabase(note: any(named: 'note', that: isNotNull)),)
            .thenAnswer((_) async =>
        const Right(tSuccessString),
        );
        final result = await useCaseUpdateNote!(tNote);
        expect(result, const Right<Failure, String>(tSuccessString));
        verify(() => mockNoteRepository!.updateNoteInDatabase(note: tNote));
        verifyNoMoreInteractions(mockNoteRepository);
      });
}
