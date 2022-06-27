// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_delete_note.dart';

class MockNoteRepository extends Mock implements INoteRepository{}
class FakeNote extends Fake implements Note{}

void main(){
  UseCaseDeleteNote? useCaseDeleteNote;
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
    useCaseDeleteNote = UseCaseDeleteNote(noteRepository: mockNoteRepository);
    fakeNote = FakeNote();
    registerFallbackValue(fakeNote);
  });

  test(
      'should pass note to repository to delete it using deleteNoteFromDatabase',
      () async{
        when(() => mockNoteRepository!
            .deleteNoteFromDatabase(note: any(named: 'note', that: isNotNull)),)
            .thenAnswer((_) async =>
        const Right(tSuccessString),
        );
        final result = await useCaseDeleteNote!(tNote);
        expect(result, const Right<Failure, String>(tSuccessString));
        verify(() => mockNoteRepository!.deleteNoteFromDatabase(note: tNote));
        verifyNoMoreInteractions(mockNoteRepository);
      });
}
