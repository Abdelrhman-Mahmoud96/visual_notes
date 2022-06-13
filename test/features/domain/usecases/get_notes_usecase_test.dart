import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_get_notes.dart';

class MockNoteRepository extends Mock implements NoteRepository{}
class FakeNotes extends Fake implements List<Note>{}

void main(){
  UseCaseGetNotes? useCaseGetNote;
  MockNoteRepository? mockNoteRepository;
  FakeNotes? fakeNotes;
  final tNotes = [
    Note(
    id: '1',
    title:'test',
    imageData: '',
    description: 'test',
    date: DateTime.now(),)
  ];

  setUp((){
    mockNoteRepository = MockNoteRepository();
    useCaseGetNote = UseCaseGetNotes(noteRepository: mockNoteRepository);
    fakeNotes = FakeNotes();
    registerFallbackValue(fakeNotes);
  });

  test(
      'should get note list from repository using getNotesFromDatabase',
          () async{
        when(() => mockNoteRepository!
            .getNotesFromDatabase(),)
            .thenAnswer((_) async*{
              yield Right<Failure, List<Note>>(tNotes);
        });

        final result =  useCaseGetNote!(const NoParams());
        await expectLater(result, emits(Right<Failure, List<Note>>(tNotes)));
        verify(() => mockNoteRepository!.getNotesFromDatabase());
        verifyNoMoreInteractions(mockNoteRepository);

        // that would work too
        //
        // final result = await useCaseGetNote!(NoParams()).first;
        // expect(result, Right<Failure, List<Note>>(tNotes));
        // verify(() => mockNoteRepository!.getNotesFromDatabase());
        // verifyNoMoreInteractions(mockNoteRepository);
        //
        // or this
        //
        // final result =  useCaseGetNote!(NoParams());
        // expect(result, emits(Right<Failure, List<Note>>(tNotes)));
        // await untilCalled(() => mockNoteRepository!.getNotesFromDatabase());
        // verify(() => mockNoteRepository!.getNotesFromDatabase());
        // verifyNoMoreInteractions(mockNoteRepository);
        //
        //that one too
        //
        // useCaseGetNote!(NoParams()).listen((result) {
        //   expect(result, Right<Failure, List<Note>>(tNotes));
        //   verify(() => mockNoteRepository!.getNotesFromDatabase());
        //   verifyNoMoreInteractions(mockNoteRepository);
        // });
        //
        // the general case is we have to await for the stream to emit new data
        // either by using 'expectLater' or with 'untilCalled'

      });
}
