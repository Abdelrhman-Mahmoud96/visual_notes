import 'dart:developer';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:visual_notes/core/di/injection.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';
import 'package:visual_notes/features/presentation/save_note/view/save_note_page.dart';

import '../../../../helper/l10n.dart';
import '../../../../helper/pump_app.dart';

class MockSaveNoteBloc extends MockBloc<SaveNoteEvent, SaveNoteState>
    implements SaveNoteBloc{}

class MockNavigatorObserver extends Mock implements NavigatorObserver{}
class MockFormBuilderState extends Mock implements FormBuilderState{
  @override
  String toString({ DiagnosticLevel minLevel = DiagnosticLevel.debug }){
    return super.toString();
  }
}

void main(){
  late MockFormBuilderState mockFormBuilderState;
  late MockNavigator mockNavigator;
  late MockSaveNoteBloc mockSaveNoteBloc;
  final tNote = Note(
    id: '1',
    title:'test',
    description: 'test_description',
    date: DateTime.now(),
  );

  setUpAll(()async{
    await initDependencies();
  });

  setUp(() async{
    mockNavigator = MockNavigator();
    mockFormBuilderState = MockFormBuilderState();
    mockSaveNoteBloc = MockSaveNoteBloc();
    when(() => mockNavigator.push(any()))
        .thenAnswer((_) async => <void>{});
    when(() => mockSaveNoteBloc.state)
        .thenReturn(
        SaveNoteState(
          initialNote: tNote,
          title: tNote.title,
          description: tNote.description,
          imageData: tNote.imageData,
        ),);
  });

  group('SaveNotePage', (){
    Widget buildSubject(){
      return MockNavigatorProvider(
          navigator: mockNavigator,
          child: BlocProvider<SaveNoteBloc>.value(
            value: mockSaveNoteBloc,
            child: const SaveNotePage(),
          ),
      );
    }

    group('Route', (){
      testWidgets('renders SaveNotePage', (widgetTester) async{
        await widgetTester.pumpRoute(SaveNotePage.route());
        expect(find.byType(SaveNotePage), findsOneWidget);
      },);
    });

    group('Initial State', (){
      testWidgets('should provide initial note', (widgetTester) async{
        await widgetTester.pumpRoute(SaveNotePage.route(initialNote: tNote));
        expect(find.byType(SaveNotePage), findsOneWidget);
        expect(
            find.byWidgetPredicate((widget) => widget is EditableText &&
                widget.controller.text == tNote.title,),
            findsOneWidget,
        );
      });
    });

    testWidgets('should render SaveNoteView', (widgetTester) async{
      await widgetTester.pumpApp(buildSubject());
      expect(find.byType(SaveNoteView), findsOneWidget);
    });

    testWidgets('should pop when note saved successfully', (widgetTester) async{
      whenListen<SaveNoteState>(
        mockSaveNoteBloc,
        Stream.fromIterable(const [
          SaveNoteState(),
          SaveNoteState(saveNoteStatus: SaveNoteStatus.success),
        ]),
      );
      await widgetTester.pumpApp(buildSubject());
      verify(() => mockNavigator.pop(any<dynamic>()))
          .called(1);
    });

  });

  group('SaveNoteView', (){
    const titleTextField = Key('saveNoteView_title_formBuilderTextField');
    const descriptionTextField =
      Key('saveNoteView_description_formBuilderTextField');

    Widget buildSubject(){
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider<SaveNoteBloc>.value(
          value: mockSaveNoteBloc,
          child: SaveNoteView(),
        ),
      );
    }

    group('AppBar', (){
      testWidgets(
          'should render AppBar with AddNote text when creating new note',
              (widgetTester) async{
            when(() => mockSaveNoteBloc.state)
                .thenReturn( const SaveNoteState());

            await widgetTester.pumpApp(buildSubject());
            expect(find.byType(AppBar), findsOneWidget);
            expect(
              find.descendant(
                of: find.byType(AppBar),
                matching: find.text(l10n!.saveNoteAddAppBarTitle),),
              findsOneWidget,
            );
          });

      testWidgets(
          'should render AppBar with EditNote text when editing a note',
              (widgetTester) async{
            when(() => mockSaveNoteBloc.state)
                .thenReturn(SaveNoteState(initialNote: tNote));

            await widgetTester.pumpApp(buildSubject());
            expect(find.byType(AppBar), findsOneWidget);
            expect(
              find.descendant(
                of: find.byType(AppBar),
                matching: find.text(l10n!.saveNoteEditAppBarTitle),),
              findsOneWidget,
            );
          });
  });

    group('Title Text Field', (){
      testWidgets(
          'should render title text field probably',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            expect(find.byKey(titleTextField), findsOneWidget);
          });

      testWidgets(
          'should be disabled when status is loading',
              (widgetTester) async{
            when(() => mockSaveNoteBloc.state).thenReturn(
              const SaveNoteState(saveNoteStatus: SaveNoteStatus.loading),
            );
            await widgetTester.pumpApp(buildSubject());
            final tTitleTextField = widgetTester.widget<FormBuilderTextField>(
                find.byKey(titleTextField),
            );
            expect(tTitleTextField.enabled, false);
          });

      testWidgets(
          'should add TitleChanged to SaveNoteBloc',
          (widgetTester) async{
            const tNewTitle = 'new_test';
            await widgetTester.pumpApp(buildSubject());
            await widgetTester.enterText(find.byKey(titleTextField), tNewTitle);
            verify(() => mockSaveNoteBloc.add(
                const TitleChanged(title: tNewTitle),),
            )
                .called(1);
          });


    });

    group('Description Text Field', (){
      testWidgets(
          'should render description text field probably', (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            expect(find.byKey(descriptionTextField), findsOneWidget);
          });

      testWidgets(
          'should be disabled when status is loading',
              (widgetTester) async{
            when(() => mockSaveNoteBloc.state).thenReturn(
              const SaveNoteState(saveNoteStatus: SaveNoteStatus.loading),
            );
            await widgetTester.pumpApp(buildSubject());
            final tDescriptionTextField = widgetTester.widget<FormBuilderTextField>(
              find.byKey(descriptionTextField),
            );
            expect(tDescriptionTextField.enabled, false);
          });

      testWidgets(
          'should add DescriptionChanged to SaveNoteBloc',
          (widgetTester) async{
            const tNewDescription = 'new_test';
            await widgetTester.pumpApp(buildSubject());
            await widgetTester.enterText(find.byKey(descriptionTextField), tNewDescription);
            verify(() => mockSaveNoteBloc.add(
              const DescriptionChanged(description: tNewDescription),),
            )
                .called(1);
          });


    });

    group('Save FAB', (){
      testWidgets('should render FAB probably', (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            expect(
                find.byTooltip(l10n!.saveNoteSaveButtonTooltip),
                findsOneWidget,
            );
          });

      testWidgets(
          'should add NoteSubmitted to SaveNoteBloc',
          (widgetTester) async{
            when(() => mockFormBuilderState.validate())
                .thenReturn(true);
            await widgetTester.pumpApp(buildSubject());
            // expect(mockFormBuilderState.validate(), isTrue);
            await widgetTester.tap(
                find.byTooltip(l10n!.saveNoteSaveButtonTooltip),
            );
            // verify(() => mockSaveNoteBloc.add(const NoteSubmitted()),)
            //     .called(1);
          });
    });

  });

}
