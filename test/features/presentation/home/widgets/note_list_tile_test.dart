import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/features/data/database/database_constants.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/presentation/home/widgets/note_list_tile.dart';

import '../../../../helper/pump_app.dart';

void main(){
  group('Note List Tile', (){
    final tOpenNote =  Note(
      id: '1',
      title:'test',
      imageData: 'gg',
      description: 'test',
      date: DateTime.now(),);

    final tClosedNote =  Note(
      id: '1',
      title:'test',
      imageData: 'gg',
      description: 'test',
      date: DateTime.now(),
      isClosed: true,);

    final onToggleCalls = <bool>[];
    final onDismissedKey = Key('note_list_dismissible_${tOpenNote.id}');
    late int onTapCallCount;
    late int onDismissedCallCount;

    Widget buildSubject({Note? note}){
      return NoteListTile(
        note: note,
        onDismissed: (_) => onDismissedCallCount++,
        onToggleClosed: onToggleCalls.add,
        onTap: () => onTapCallCount++,
      );
    }

    setUp((){
      onDismissedCallCount = 0;
      onTapCallCount = 0;
    });

    group('Constructor', (){
      test('should work properly', (){
        expect(() => NoteListTile(note: tOpenNote,), returnsNormally);
      });
    });

    group('Check Box', (){
      testWidgets('should render properly', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tOpenNote));
        expect(find.byType(Checkbox), findsOneWidget);
      });

      testWidgets('should be check when note is closed', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tClosedNote));
        final tCheckBox = widgetTester
            .widget<Checkbox>(find.byType(Checkbox));

        expect(tCheckBox.value, isTrue);
      });

      testWidgets('should be check when note is closed', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tOpenNote));
        final tCheckBox = widgetTester
            .widget<Checkbox>(find.byType(Checkbox));

        expect(tCheckBox.value, isFalse);
      });

      testWidgets(
          'should call onToggleClosed when tapped',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject(note: tOpenNote));
            await widgetTester.tap(find.byType(Checkbox));
            expect(onToggleCalls, equals([true]));
      });

    });

    group('Dismissible', (){
      testWidgets('should render properly', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tOpenNote));
        expect(find.byType(Dismissible), findsOneWidget);
        expect(find.byKey(onDismissedKey), findsOneWidget);
      });

      testWidgets(
          'should call onDismissed when swiped to the left',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject(note: tOpenNote));
            await widgetTester.fling(
                find.byKey(onDismissedKey),
                const Offset(-300, 0),
                3000,
            );
            await widgetTester.pumpAndSettle();
            expect(onDismissedCallCount, 1);
        }
      );

    });

    group('onTap', (){
      testWidgets(
          'should call onTap when pressed',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject(note: tOpenNote));
            await widgetTester.tap(find.byType(NoteListTile));
            expect(onTapCallCount, 1);
          }
      );

    });

    group('Note Title', (){
      testWidgets('should render properly', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tOpenNote));
        expect(find.text(tOpenNote.title!), findsOneWidget);
      });

      testWidgets(
          'should struck-through when note is closed',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject(note: tClosedNote));
            final tTitle = widgetTester
                .widget<Text>(find.text(tClosedNote.title!));
            expect(
                tTitle.style,
                isA<TextStyle>().having((style) =>
                  style.decoration, 'decoration', TextDecoration.lineThrough,),
            );
      });

    });

    group('Note Date', (){
      testWidgets('should render properly', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject(note: tOpenNote));
        final tDateFormatted = DateFormat(kDateFormat).format(tOpenNote.date);
        expect(find.text(tDateFormatted), findsOneWidget);
      });
    });

  });
}
