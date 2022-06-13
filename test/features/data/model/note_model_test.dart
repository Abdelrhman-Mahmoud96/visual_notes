import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:visual_notes/features/data/models/note_model.dart';
import 'package:visual_notes/features/domain/entities/note.dart';

import '../../../fixtures/fixture_reader.dart';

void main(){
  final tNoteModel = NoteModel(
    id: '1',
    title: 'test',
    imageData: '',
    description: 'test note',
    isClosed: false,
    date: DateTime.parse('2022-06-02'),
  );

  test(
    'should be subclass of Note',
      () async{
         expect(tNoteModel, isA<Note>());
      }
  );

  group('from_json',(){
    test(
        'should return valid note model',
        () async{
          final jsonData = jsonDecode(fixtureReader('note.json'))
          as Map<String, dynamic>;

          final result = NoteModel.fromDatabase(jsonData);
          expect(result, tNoteModel);
      });
  });

  group('to_json', (){
    test('should send a valid note model after converting it to json', () async{

      final jsonNote = {
        'id' : '1',
        'title' : 'test',
        'imagePath': '',
        'description': 'test note',
        'isClosed': false,
        'date': '2022-06-02 00:00:00.000' //sigh
      };
      final result = tNoteModel.toDatabase();
      expect(result, jsonNote);

    });
  });
}
