import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/home/utils/filter.dart';
import 'package:visual_notes/features/presentation/home/widgets/note_filter_button.dart';
import '../../../../helper/l10n.dart';
import '../../../../helper/pump_app.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc{}

extension on CommonFinders{
  Finder filterMenuItem({
    required NoteViewFilter filter,
    required String title,
  }) {
    return find.descendant(
        of: find.byWidgetPredicate(
                (widget) => widget is PopupMenuItem && widget.value == filter,),
        matching: find.text(title),
    );
  }
}

extension on WidgetTester{
  Future<void> openPopUp() async{
    await tap(find.byType(NoteFilterButton));
    await pumpAndSettle();
  }
}

void main(){
  late MockHomeBloc mockHomeBloc;

  group('NoteFilterButton', (){
    setUp((){
      mockHomeBloc = MockHomeBloc();
      when(() => mockHomeBloc.state).thenAnswer((_) => const HomeState(
          noteHomeStatus: NoteHomeStatus.success,
          notes: <Note>[],),
      );
    });

    Widget buildSubject(){
      return BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const NoteFilterButton(),
      );
    }

    group('Constructor', (){
      test('should works probably', (){
        expect(() => const NoteFilterButton(), returnsNormally);
      });
    });

    group('Rendering', (){
      testWidgets('should render probably', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject());
        expect(find.byType(NoteFilterButton), findsWidgets);
        //this also is a valid way
        // expect(find.byIcon(Icons.filter_list_rounded), findsOneWidget);
      });
    });

    group('PopUp Menu Buttons', (){
      testWidgets('should render probably', (widgetTester) async{
        await widgetTester.pumpApp(buildSubject());
        expect(
            find.byType(PopupMenuButton<NoteViewFilter>),
            findsOneWidget,
        );
      });

      testWidgets(
          'should has initial value set to active filter',
          (widgetTester) async{
            when(() => mockHomeBloc.state).thenAnswer((_) =>
                const HomeState(noteViewFilter: NoteViewFilter.isOpen),);

            await widgetTester.pumpApp(buildSubject());

            final tPopupMenuButton = widgetTester
                .widget<PopupMenuButton<NoteViewFilter>>(
              find.byType(PopupMenuButton<NoteViewFilter>),);

            expect(tPopupMenuButton.initialValue, NoteViewFilter.isOpen);
        }
      );

      testWidgets(
          'should render right items when filter button pressed',
          (widgetTester) async{
            await widgetTester.pumpApp(buildSubject());
            await widgetTester.openPopUp();
            expect(
                find.filterMenuItem(
                    filter: NoteViewFilter.all,
                    title: l10n!.noteFilterAll,),
                findsOneWidget,);

            expect(
              find.filterMenuItem(
                filter: NoteViewFilter.isOpen,
                title: l10n!.noteFilterOpenOnly,),
              findsOneWidget,);

            expect(
              find.filterMenuItem(
                filter: NoteViewFilter.isClosed,
                title: l10n!.noteFilterClosedOnly,),
              findsOneWidget,);
          }
      );

      testWidgets(
          'should add FilterChanged event to HomeBloc'
              ' when popUpMenuButton pressed',
          (widgetTester) async{
            when(() => mockHomeBloc.state).thenAnswer((_) =>
            const HomeState(noteViewFilter: NoteViewFilter.all),);

            await widgetTester.pumpApp(buildSubject());
            await widgetTester.openPopUp();

            await widgetTester.tap(find.text(l10n!.noteFilterClosedOnly));
            await widgetTester.pumpAndSettle();
            verify(() => mockHomeBloc.add(
                const FilterChanged(filter: NoteViewFilter.isClosed),),)
                .called(1);
          }
      );

    });

  });



}
