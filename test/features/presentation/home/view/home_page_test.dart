import 'dart:developer';
import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:visual_notes/core/di/injection.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/features/data/repository/note_database_repository.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_delete_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_get_notes.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/home/view/home_page.dart';
import 'package:visual_notes/features/presentation/home/widgets/note_list_tile.dart';
import '../../../../helper/l10n.dart';
import '../../../../helper/pump_app.dart';


class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc{}
class MockUseCaseAddNote extends Mock implements UseCaseAddNote{}
class MockUseCaseDeleteNote extends Mock implements UseCaseDeleteNote{}
class MockUseCaseUpdateNote extends Mock implements UseCaseUpdateNote{}
class MockUseCaseGetNotes extends Mock implements UseCaseGetNotes{}
class MockRepository extends Mock implements NoteDatabaseRepository{}
class FakeNoParams extends Fake implements NoParams{}

Future<void> main() async{
  late MockUseCaseGetNotes mockUseCaseGetNotes;
  late MockHomeBloc mockHomeBloc;
  late FakeNoParams fakeNoParams;
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

  setUpAll(() async{
    mockUseCaseGetNotes = MockUseCaseGetNotes();
    mockHomeBloc = MockHomeBloc();
    fakeNoParams = FakeNoParams();
    registerFallbackValue(fakeNoParams);
    //when working with di we should call dependencies initialization method
    // in the test too
    await initDependencies();
  });

  group('Home Page', (){
    setUp((){
      when(() => mockUseCaseGetNotes.call(any()))
          .thenAnswer((_) async*{
        yield Right<Failure, List<Note>>(tNotes);
      });
    });

    testWidgets(
        'should render HomeView',
        (widgetTester) async{
          await widgetTester.pumpApp(
            const HomePage(),
          );
          expect(find.byType(HomeView), findsOneWidget);
        });

    testWidgets(
        'should get notes from repository',
        (widgetTester) async{
          await widgetTester.pumpApp(
            const HomePage(),
          );
          // verify(() => mockHomeBloc.add(const GetNotes())).called(1);
          // verify(() => mockUseCaseGetNotes.call(const NoParams())).called(1);
    });
  });

  group('Home View', (){
    late MockNavigator mockNavigator;

    setUp((){
      mockNavigator = MockNavigator();
      // explicitly providing the type is very important for testing to work,
      // especially if we are creating mocks
      when(() => mockNavigator.push<void>(any()))
          .thenAnswer((_) async => <void>{});

      when(() => mockHomeBloc.state).thenReturn(HomeState(
        noteHomeStatus: NoteHomeStatus.success,
        notes: tNotes,
      ),);

      when(() => mockUseCaseGetNotes.call(const NoParams()))
          .thenAnswer((_) async*{
            yield const Right<Failure, List<Note>>(<Note>[]);
      });
    });

    Widget buildSubject(){
      return MockNavigatorProvider(
          navigator: mockNavigator,
          // it's very important to use the same bloc provider as the one in the
         // base code (by specifying the type ex: <HomeBloc>)
        // so the mock bloc could work
          child: BlocProvider<HomeBloc>.value(
            value: mockHomeBloc,
            child: const HomeView(),
          ),
      );
    }

    testWidgets(
        'should render AppBar with title test',
        (widgetTester) async{
          await widgetTester.pumpApp(
            buildSubject(),
          );
        expect(find.byType(AppBar), findsOneWidget);
        expect(
            find.descendant(of: find.byType(AppBar),
                matching: find.text(l10n!.notesAppBarTitle),),
            findsOneWidget,
        );
    });

    testWidgets(
        'should show snack bar when status is failure',
        (widgetTester) async{
          //'whenListen' is used when we want the bloc to emit certain states so
          // we can test on that case
          whenListen<HomeState>(
              mockHomeBloc,
              Stream.fromIterable([
                const HomeState(),
                const HomeState(noteHomeStatus: NoteHomeStatus.failure),
              ]),
          );
          await widgetTester.pumpApp(buildSubject(),);
          //it will call pump for each frame and wait for all animation
          // to be done, in our case the snack bar
          await widgetTester.pumpAndSettle();
          expect(find.byType(SnackBar), findsOneWidget);
          expect(
              find.descendant(of: find.byType(SnackBar),
                  matching: find.text(l10n!.notesHomePageErrorSnackbarText),),
              findsOneWidget,);
    });

    group('Note Deletion Snackbar', (){
      setUp((){
        when(() => mockHomeBloc.state).thenAnswer((_) =>
            HomeState(lastDeletedNote: tNotes.first),
        );
        whenListen<HomeState>(
          mockHomeBloc,
          Stream.fromIterable([
            const HomeState(),
            HomeState(lastDeletedNote: tNotes.first),
          ]),
        );
      });

      testWidgets(
          'should render when lastDeletedNote is changed',
              (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            await widgetTester.pumpAndSettle();
            expect(find.byType(SnackBar), findsOneWidget);
            expect(
                find.descendant(
                    of: find.byType(SnackBar),
                    matching: find.text(
                        l10n!.notesHomePageNoteDeletedSnackbar(
                            tNotes.first.title!,),
                    ),
                ),
                findsOneWidget,
            );
            // final snackbar = tester.widget<SnackBar>(find.byType(SnackBar));
            // expect(snackbar.content, isA<Text>()
            //     .having((text) =>
            // text.data, 'text', contains(tNotes.first.title),),
            // );
          });

      testWidgets(
          'should adds UndoDeletionRequested to HomeBloc when undo is pressed',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            await widgetTester.pumpAndSettle();
            final snackbarAction = widgetTester.widget<SnackBarAction>(
                find.byType(SnackBarAction),);

            snackbarAction.onPressed();

            verify(() =>
                mockHomeBloc.add(const UndoDeletionRequested()),).called(1);
      });

    });

    group('Notes is Empty', (){
      setUp((){
        when(() => mockHomeBloc.state).thenAnswer((_) => const HomeState());
      });

      testWidgets(
          'render nothing',
          (widgetTester) async {
            await widgetTester.pumpApp(buildSubject());
            expect(find.byType(ListView), findsNothing);
            expect(find.byType(CircularProgressIndicator), findsNothing);
            expect(find.byType(Image), findsNothing);
          }
      );

      testWidgets(
          'should render loading indicator',
          (widgetTester) async{
              when(() => mockHomeBloc.state)
                  .thenAnswer((_) =>
              const HomeState(noteHomeStatus: NoteHomeStatus.loading),);
              await widgetTester.pumpApp(buildSubject());
              expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets(
          'render the no notes available image',
              (widgetTester) async{
            when(() => mockHomeBloc.state).thenAnswer((_) => const HomeState(
              noteHomeStatus: NoteHomeStatus.success,
              notes: <Note>[],),
            );
            await widgetTester.pumpApp(buildSubject());
            expect(find.byType(Image), findsOneWidget);
            final imagePlaceHolder = widgetTester
                .widget<Image>(find.byType(Image));

            expect(
              imagePlaceHolder,
              isA<Image>()
                  .having((image) => image.image, 'image', const AssetImage('assets/no_notes_list.jpg')),
            );
          });
    });

    group('Notes is Not Empty', (){
      setUp((){
        when(() => mockHomeBloc.state).thenAnswer((_) =>
            HomeState(noteHomeStatus: NoteHomeStatus.success, notes: tNotes),);
      });

      testWidgets(
          'should show listView with NotesListTile',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            expect(find.byType(ListView), findsOneWidget);
            expect(find.byType(NoteListTile), findsNWidgets(tNotes.length));
          });

      testWidgets(
          'should add CloseToggled to HomeBloc',
            (widgetTester) async{
              await widgetTester.pumpApp(buildSubject());

              final noteListTile = widgetTester
                  .widget<NoteListTile>(find.byType(NoteListTile).first);

              final tNote = tNotes.first;
              noteListTile.onToggleClosed!(!tNote.isClosed);

              verify(() =>
                  mockHomeBloc.add(ClosedToggled(
                      note: tNote,
                      isClosed: !tNote.isClosed,),),)
                  .called(1);
          });

      testWidgets(
          'should add DeleteNote to HomeBloc',
              (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());

            final noteListTile = widgetTester
                .widget<NoteListTile>(find.byType(NoteListTile).first);

            final tNote = tNotes.first;
            noteListTile.onDismissed!(DismissDirection.startToEnd);

            verify(() =>
                mockHomeBloc.add(DeleteNote(note: tNote)),)
                .called(1);
          });

      testWidgets(
          'should navigate to SaveNote Screen',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());

            final noteListTile = widgetTester
                .widget<NoteListTile>(find.byType(NoteListTile).first);

            noteListTile.onTap!();

            verify(() => mockNavigator.push<void>(any(that: isRoute<void>())))
                .called(1);
          });
    });

  });
}
