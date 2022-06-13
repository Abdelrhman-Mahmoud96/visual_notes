import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/features/data/database/app_database.dart';
import 'package:visual_notes/features/data/models/note_model.dart';
import 'package:visual_notes/features/data/repository/note_database_repository.dart';
import 'package:visual_notes/features/domain/entities/note.dart';

void main(){
  NoteDatabaseRepository? noteDatabaseRepo;
  AppDatabase? mockAppDatabase;

  setUp(() async{
    mockAppDatabase = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    noteDatabaseRepo = NoteDatabaseRepository(database: mockAppDatabase);
  });

  group('get_notes', (){
    test('should return list of notes from database', () async*{
      final tNotes = [NoteModel(
        id: '1',
        title:'test',
        imageData: 'gg',
        description: 'test note',
        date: DateTime.parse('2022-06-02 14:50'),
        isClosed: false,
      )];

      final expected = Right<Failure, List<Note>>(tNotes);
      final result = noteDatabaseRepo!.getNotesFromDatabase();
      expect(result, expected);

    });
  });

  group('add_note', (){
    test('should send a note to insert it in database', () async{
      final tNoteModel = NoteModel(
        id: '1',
        title:'test',
        imageData: 'gg',
        description: 'test note',
        date: DateTime.parse('2022-06-02 14:50'),
        isClosed: false,
      );
      const expected = Right<Failure, String>('ADD_NOTE_SUCCESS');

      final result= await noteDatabaseRepo!.addNoteToDatabase(note: tNoteModel);
      expect(result, expected);
    });
  });

  group('delete_note', (){
    test('should send a note to delete it from database', () async{
      final tNoteModel = NoteModel(
        id: '1',
        title:'test',
        imageData: 'gg',
        description: 'test note',
        date: DateTime.parse('2022-06-02 14:50'),
        isClosed: false,
      );
      await noteDatabaseRepo!.addNoteToDatabase(note: tNoteModel);

      const expected = Right<Failure, String>('DELETE_NOTE_SUCCESS');
      final result = await noteDatabaseRepo!
          .deleteNoteFromDatabase(note: tNoteModel);

      expect(result, expected);
    });
  });

  group('update_notes', (){
    test('should send a note to update it in database', () async{
      final tNoteModel = NoteModel(
        id: '1',
        title:'test',
        imageData: 'gg',
        description: 'test note',
        date: DateTime.parse('2022-06-02 14:50'),
        isClosed: false,
      );

      final tNewNoteTest = tNoteModel.copyWith(title: 'new test');

      await noteDatabaseRepo!.addNoteToDatabase(note: tNoteModel);

      final result = await noteDatabaseRepo!
          .updateNoteInDatabase(note: tNewNoteTest);
      const expected = Right<Failure, String>('UPDATE_NOTE_SUCCESS');

      expect(expected, result);
    });
  });

}
