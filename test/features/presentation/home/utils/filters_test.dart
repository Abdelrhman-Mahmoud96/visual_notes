import 'package:flutter_test/flutter_test.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/presentation/home/utils/filter.dart';

void main(){
  group('HomeViewFilter', (){
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

    group('Apply', (){
      test(
        'should always return true when filter is .all',
        (){
          expect(NoteViewFilter.all.apply(tOpenNote), isTrue);
          expect(NoteViewFilter.all.apply(tClosedNote), isTrue);
      },);

      test(
          'should return true when filter is .isOpen',
          (){
            expect(NoteViewFilter.isOpen.apply(tOpenNote), isTrue);
            expect(NoteViewFilter.isOpen.apply(tClosedNote), isFalse);
      });

      test(
          'should return true when filter is .isClosed',
              (){
            expect(NoteViewFilter.isClosed.apply(tOpenNote), isFalse);
            expect(NoteViewFilter.isClosed.apply(tClosedNote), isTrue);
          });

    });

    group('Apply All', (){
      final tAllNotes = [tOpenNote, tClosedNote];
      test(
          'should filter provided iterable based on the filter',
          (){
            expect(
                NoteViewFilter.all.applyToAll(tAllNotes),
                equals(tAllNotes),);
            expect(
                NoteViewFilter.isOpen.applyToAll(tAllNotes),
                equals([tOpenNote]),);
            expect(
                NoteViewFilter.isClosed.applyToAll(tAllNotes),
                equals([tClosedNote]),);
          }
      );


    });

  });
}