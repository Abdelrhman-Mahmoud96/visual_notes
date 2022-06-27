// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';

class MockUseCaseAddNote extends Mock implements UseCaseAddNote{}
class MockUseCaseUpdateNote extends Mock implements UseCaseUpdateNote{}
class FakeNote extends Fake implements Note{}

void main() {
  MockUseCaseAddNote? mockUseCaseAddNote;
  MockUseCaseUpdateNote? mockUseCaseUpdateNote;
  FakeNote? fakeNote;
  const tSuccessString = 'Success';
  const tFailureString = 'Failed';
  final tNote = Note(
      id: '1',
      title: 'test',
      imageData: 'gg',
      description: 'test',
      date: DateTime.now(),);

  SaveNoteBloc buildBloc(){
    return SaveNoteBloc(
      useCaseAddNote: mockUseCaseAddNote,
      useCaseUpdateNote: mockUseCaseUpdateNote,
    );
  }

  setUpAll((){
    mockUseCaseAddNote = MockUseCaseAddNote();
    mockUseCaseUpdateNote = MockUseCaseUpdateNote();
    fakeNote = FakeNote();
    registerFallbackValue(fakeNote);
  });

  group('Constructor', (){
    test('works probably', (){
      expect(buildBloc, returnsNormally);
    });

    test('returns the right initial state', (){
      expect(
          buildBloc().state,
          equals(const SaveNoteState()),
      );
    });

  });

  group('Title Changed', (){
    blocTest<SaveNoteBloc, SaveNoteState>(
      'should emits a state with new title',
      build: buildBloc,
      act: (bloc) => bloc.add(const TitleChanged(title: 'newTitle')),
      expect: () => const [
         SaveNoteState(title: 'newTitle'),
      ],
    );
  });

  group('Description Changed', (){
    blocTest<SaveNoteBloc, SaveNoteState>(
      'should emits a state with new description',
      build: buildBloc,
      act: (bloc) =>
          bloc.add(const DescriptionChanged(description: 'newDescription')),
      expect: () => const [
        SaveNoteState(description: 'newDescription'),
      ],
    );
  });

  group('Image Changed', (){
    blocTest<SaveNoteBloc, SaveNoteState>(
      'should emits a state with new image',
      build: buildBloc,
      act: (bloc) =>
          bloc.add(const ImageChanged(imageData: 'newImage')),
      expect: () => const [
        SaveNoteState(imageData: 'newImage'),
      ],
    );
  });

  group('Note Submitted', (){
    blocTest<SaveNoteBloc, SaveNoteState>(
      'should add a note as new when initial note is empty',
      setUp: (){
        when(() => mockUseCaseAddNote!.call(any()))
            .thenAnswer((_) async =>
        const Right<Failure, String>(tSuccessString),);
      },
      build: buildBloc,
      seed: () => const SaveNoteState(
          title: 'title',
          description: 'description',
          imageData: 'imageData',
      ),
      act: (bloc) =>
          bloc.add(const NoteSubmitted()),
      expect: () => const [
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.loading,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.success,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
      ],
      verify: (bloc) {
        verify(() => mockUseCaseAddNote!.call(

          any(that: isA<Note>()
                .having((v) => v.title, 'title', equals('title'))
                .having((v) => v.description,'description',equals('description'))
                .having((v) => v.imageData, 'imageData', equals('imageData')),),
          ),
        ).called(1);
      },
    );

    blocTest<SaveNoteBloc, SaveNoteState>(
      'should fail when trying to submit a new note ',
      setUp: (){
        when(() => mockUseCaseAddNote!.call(any()))
            .thenAnswer((_) async => Left<Failure, String>(StorageFailure(
            storageFailureMessage: tFailureString,),),);
      },
      build: buildBloc,
      seed: () => const SaveNoteState(
        title: 'title',
        description: 'description',
        imageData: 'imageData',
      ),
      act: (bloc) =>
          bloc.add(const NoteSubmitted()),
      expect: () => const [
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.loading,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.failure,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
          errorMessage: tFailureString,
        ),
      ],
    );

    blocTest<SaveNoteBloc, SaveNoteState>(
      'should update a note when initial note is not empty',
      setUp: (){
        when(() => mockUseCaseUpdateNote!.call(any()))
            .thenAnswer((_) async =>
        const Right<Failure, String>(tSuccessString),);
      },
      build: buildBloc,
      seed: () => SaveNoteState(
        initialNote: tNote,
        title: 'title',
        description: 'description',
        imageData: 'imageData',
      ),
      act: (bloc) =>
          bloc.add(const NoteSubmitted()),
      expect: () => [
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.loading,
          initialNote: tNote,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.success,
          initialNote: tNote,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
      ],
      verify: (bloc) {
        verify(() => mockUseCaseUpdateNote!.call(
          any(that: isA<Note>()
              .having((v) => v.id, 'id', equals(tNote.id))
              .having((v) => v.title, 'title', equals('title'))
              .having((v) => v.description,'description',equals('description'))
              .having((v) => v.imageData, 'imageData', equals('imageData')),),
          ),
        ).called(1);
      },
    );

    blocTest<SaveNoteBloc, SaveNoteState>(
      'should fail when trying to submit an updated note ',
      setUp: (){
        when(() => mockUseCaseUpdateNote!.call(any()))
            .thenAnswer((_) async => Left<Failure, String>(StorageFailure(
          storageFailureMessage: tFailureString,),),);
      },
      build: buildBloc,
      seed: () => SaveNoteState(
        initialNote: tNote,
        title: 'title',
        description: 'description',
        imageData: 'imageData',
      ),
      act: (bloc) =>
          bloc.add(const NoteSubmitted()),
      expect: () => [
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.loading,
          initialNote: tNote,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
        ),
        SaveNoteState(
          saveNoteStatus: SaveNoteStatus.failure,
          initialNote: tNote,
          title: 'title',
          description: 'description',
          imageData: 'imageData',
          errorMessage: tFailureString,
        ),
      ],
    );

  });
}
