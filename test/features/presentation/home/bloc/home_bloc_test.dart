import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_delete_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_get_notes.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/home/utils/filter.dart';

class MockUseCaseAddNote extends Mock implements UseCaseAddNote{}
class MockUseCaseDeleteNote extends Mock implements UseCaseDeleteNote{}
class MockUseCaseUpdateNote extends Mock implements UseCaseUpdateNote{}
class MockUseCaseGetNotes extends Mock implements UseCaseGetNotes{}
class FakeNote extends Fake implements Note{}
class FakeNoParams extends Fake implements NoParams{}

void main(){
  MockUseCaseAddNote? mockUseCaseAddNote;
  MockUseCaseDeleteNote? mockUseCaseDeleteNote;
  MockUseCaseUpdateNote? mockUseCaseUpdateNote;
  MockUseCaseGetNotes? mockUseCaseGetNotes;
  FakeNoParams? fakeNoParams;
  FakeNote? fakeNote;
  const tSuccessString = 'Success';
  const tFailureString = 'Failed';
  final tNotes = [
    Note(
      id: '1',
      title:'test',
      imageData: 'gg',
      description: 'test',
      date: DateTime.now(),),
    Note(
      id: '2',
      title:'test 2',
      imageData: 'gg',
      description: 'test 2',
      date: DateTime.now(),),
    Note(
      id: '3',
      title:'test 3',
      imageData: 'gg',
      description: 'test 3',
      date: DateTime.now(),)
  ];

  HomeBloc buildBloc(){
    return HomeBloc(
      useCaseAddNote: mockUseCaseAddNote!,
      useCaseDeleteNote: mockUseCaseDeleteNote!,
      useCaseUpdateNote: mockUseCaseUpdateNote!,
      useCaseGetNotes: mockUseCaseGetNotes!,
    );
  }

  setUpAll((){
    mockUseCaseAddNote = MockUseCaseAddNote();
    mockUseCaseDeleteNote = MockUseCaseDeleteNote();
    mockUseCaseUpdateNote = MockUseCaseUpdateNote();
    mockUseCaseGetNotes = MockUseCaseGetNotes();
    fakeNote = FakeNote();
    fakeNoParams = FakeNoParams();
    registerFallbackValue(fakeNote);
    registerFallbackValue(fakeNoParams);
  });

  group('Constructor', (){
    test('should work probably', (){
      expect(buildBloc, returnsNormally);
    });

    test('should has the correct initial state', (){
      expect(buildBloc().state, equals(const HomeState(
          noteHomeStatus: NoteHomeStatus.initial,),),);
    });
  });

  group('Get Notes', (){
    blocTest<HomeBloc, HomeState>(
      'should return all the notes from the database using repository',
      setUp: (){
        when(() => mockUseCaseGetNotes!.call(any()))
            .thenAnswer((_) async* {
          yield Right<Failure, List<Note>>(tNotes);
        });
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const GetNotes()),
      expect: () => [
        equals(const HomeState(
            noteHomeStatus: NoteHomeStatus.loading,
            notes: [],),),
        equals(HomeState(
            noteHomeStatus: NoteHomeStatus.success,
            notes: tNotes,),),
      ],
      verify: (_) async{
        verify(() => mockUseCaseGetNotes!.call(const NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'should fail and return error when trying to get notes from the database',
      setUp: (){
        when(() => mockUseCaseGetNotes!.call(any()))
            .thenAnswer((_) async* {
          yield Left<Failure, List<Note>>(StorageFailure(
              storageFailureMessage: tFailureString,),);
        });
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const GetNotes()),
      expect: () => [
        equals(const HomeState(
          noteHomeStatus: NoteHomeStatus.loading,
          notes: [],),),
        equals(const HomeState(
          noteHomeStatus: NoteHomeStatus.failure,
          notes: [],
          errorMessage: tFailureString,
        ),),
      ],
      verify: (_) async{
        verify(() => mockUseCaseGetNotes!.call(const NoParams())).called(1);
      },
    );
  });

  group('Undo Deletion', (){
    blocTest<HomeBloc, HomeState>(
      'should re-add the last deleted note and set its property to null',
      setUp: (){
          when(() => mockUseCaseAddNote!.call(any()))
              .thenAnswer((_) async => const Right(tSuccessString));
        },
      build: buildBloc,
      seed: () => HomeState(lastDeletedNote: tNotes.first),
      act: (bloc) => bloc.add(const UndoDeletionRequested()),
      expect: () => [
        const HomeState(),
      ],
      verify: (_) {
        verify(() => mockUseCaseAddNote!.call(tNotes.first)).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'should throw error when trying to re-add the last deleted note',
      setUp: (){
        when(() => mockUseCaseAddNote!.call(any()))
            .thenAnswer((_) async =>
            Left(StorageFailure(storageFailureMessage: tFailureString)),);
      },
      build: buildBloc,
      seed: () => HomeState(lastDeletedNote: tNotes.first),
      act: (bloc) => bloc.add(const UndoDeletionRequested()),
      expect: () => [
        HomeState(
          noteHomeStatus: NoteHomeStatus.failure,
          lastDeletedNote: tNotes.first,
          errorMessage: tFailureString,
        ),
      ],
      verify: (_) {
        verify(() => mockUseCaseAddNote!.call(tNotes.first)).called(1);
      },
    );
  });

  group('Delete Note', (){
    blocTest<HomeBloc, HomeState>(
      'should delete a note using repository',
      setUp: (){
        when(() => mockUseCaseDeleteNote!.call(any()))
            .thenAnswer((_) async => const Right(tSuccessString));
      },
      build: buildBloc,
      seed: () => HomeState(notes: tNotes),
      act: (bloc) => bloc.add(DeleteNote(note: tNotes.first)),
      expect: () => [
        HomeState(
          notes: tNotes,
          noteHomeStatus: NoteHomeStatus.initial,
          noteViewFilter: NoteViewFilter.all,
          lastDeletedNote: tNotes.first,
        ),
      ],
      verify: (_){
        verify(() => mockUseCaseDeleteNote!(tNotes.first)).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'should throw an error',
      setUp: (){
        when(() => mockUseCaseDeleteNote!.call(any()))
            .thenAnswer((_) async =>
            Left(StorageFailure(storageFailureMessage: tFailureString)),);
      },
      build: buildBloc,
      seed: () => HomeState(notes: tNotes),
      act: (bloc) => bloc.add(DeleteNote(note: tNotes.first)),
      expect: () => [
        HomeState(
          notes: tNotes,
          noteHomeStatus: NoteHomeStatus.failure,
          noteViewFilter: NoteViewFilter.all,
          errorMessage: tFailureString,
        ),
      ],
      verify: (_){
        verify(() => mockUseCaseDeleteNote!(tNotes.first)).called(1);
      },
    );
  });

  group('isClosed Toggled',(){
    blocTest<HomeBloc, HomeState>(
      'should update note with the new status',
      setUp: (){
        when(() => mockUseCaseUpdateNote!.call(any()))
            .thenAnswer((_) async => const Right(tSuccessString));
      },
      build: buildBloc,
      seed: () => HomeState(notes: tNotes),
      act: (bloc) =>
          bloc.add(ClosedToggled(note: tNotes.first, isClosed: true)),
      verify: (_){
        verify(() =>
            mockUseCaseUpdateNote!(tNotes.first.copyWith(isClosed: true)),)
            .called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'should throw error when trying update note with the new status',
      setUp: (){
        when(() => mockUseCaseUpdateNote!.call(any()))
            .thenAnswer((_) async =>
            Left(StorageFailure(storageFailureMessage: tFailureString)),);
      },
      build: buildBloc,
      seed: () => HomeState(notes: tNotes),
      act: (bloc) =>
          bloc.add(ClosedToggled(note: tNotes.first, isClosed: true)),
      expect: () => [
        HomeState(
          notes: tNotes,
          noteHomeStatus: NoteHomeStatus.failure,
          errorMessage: tFailureString,
        ),
      ],
      verify: (_){
        verify(() =>
            mockUseCaseUpdateNote!(tNotes.first.copyWith(isClosed: true)),)
            .called(1);
      },
    );
  });

  group('Filter Changed',(){
    blocTest<HomeBloc, HomeState>(
      'should emit new state with the selected filter',
      build: buildBloc,
      act: (bloc) =>
          bloc.add(const FilterChanged(filter: NoteViewFilter.isOpen)),
      expect: () => [
        const HomeState(
          noteViewFilter: NoteViewFilter.isOpen,
        ),
      ],
    );
  });
}
