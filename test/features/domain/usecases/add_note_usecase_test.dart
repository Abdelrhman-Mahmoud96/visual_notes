import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';

class MockNoteRepository extends Mock implements NoteRepository{}
class FakeNote extends Fake implements Note{}

void main(){
  UseCaseAddNote? useCaseAddNote;
  MockNoteRepository? mockNoteRepository;
  FakeNote? fakeNote;

  setUp((){
    mockNoteRepository = MockNoteRepository();
    useCaseAddNote = UseCaseAddNote(noteRepository: mockNoteRepository);
    fakeNote = FakeNote();
    registerFallbackValue(fakeNote);
  });

  const tSuccessString = 'Success';
  final tNote = Note(
      id: '1',
      title:'test',
      imageData: '',
      description: 'test',
      date: DateTime.now(),);

  test(
      'should pass note to repository to add it in database',
      () async{
        when(() => mockNoteRepository!.addNoteToDatabase(
            note: any(named: 'note', that: isNotNull),),)
            .thenAnswer((_) async => const Right(tSuccessString));

        final result = await useCaseAddNote!(tNote);

        expect(result, const Right<Failure, String>(tSuccessString));
        verify(() => mockNoteRepository!.addNoteToDatabase(note: tNote));
        verifyNoMoreInteractions(mockNoteRepository);
  });
}
