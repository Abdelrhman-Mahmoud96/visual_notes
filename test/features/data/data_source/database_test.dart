import 'package:flutter_test/flutter_test.dart';
import 'package:visual_notes/features/data/database/app_database.dart';
import 'package:visual_notes/features/data/database/database_constants.dart';
import 'package:visual_notes/features/domain/entities/note.dart';

void main(){
  AppDatabase? mockAppDatabase;

  setUp(() async{
    mockAppDatabase = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
  });

  group('get_notes', (){
    test('should return list of notes from database', () async{
      // final tJsonNote = {
      //   'id' : '1',
      //   'title' : 'test',
      //   'imagePath': '',
      //   'description': 'test note',
      //   'isClosed': 0,
      //   'date': '2022-06-02 00:00:00.000' //sigh
      // };
      // await mockAppDatabase!.database.insert(kTableName, tJsonNote);
      final result = await mockAppDatabase!.database.query(kTableName);
      final expectedList  = <Note>[];
      expect(result, expectedList);
    });
  });

  group('add_note', (){
    test('should send a note to insert it in database', () async{
      final tJsonNote = {
        'id' : '1',
        'title' : 'test',
        'imagePath': '',
        'description': 'test note',
        'isClosed': 0,
        'date': '2022-06-02 00:00:00.000' //sigh
      };
      await mockAppDatabase!.database.insert(kTableName, tJsonNote);
      final expectedList  = [tJsonNote];
      final result = await mockAppDatabase!.database.query(kTableName);
      expect(result, expectedList);
    });
  });

  group('delete_note', (){
    test('should send a note to delete it from database', () async{
      final tJsonNote = {
        'id' : '1',
        'title' : 'test',
        'imagePath': '',
        'description': 'test note',
        'isClosed': 0,
        'date': '2022-06-02' //sigh
      };
      await mockAppDatabase!.database.insert(kTableName, tJsonNote);
      await mockAppDatabase!.database.delete(
          kTableName,
          where: 'id = 1',);

      final expectedList  = <Note>[];
      final result = await mockAppDatabase!.database.query(kTableName);
      expect(result, expectedList);
    });
  });

  group('update_notes', (){
    test('should send a note to update it in database', () async{
      final tJsonNote = {
        'id' : '1',
        'title' : 'test',
        'imagePath': '',
        'description': 'test note',
        'isClosed': 0,
        'date': '2022-06-02' //sigh
      };

      final tNewNoteValues = {
        'title' : ' new test',
        'description': 'new test note',
      };

      final tNewJsonNote = {
        'id' : '1',
        'title' : ' new test',
        'imagePath': '',
        'description': 'new test note',
        'isClosed': 0,
        'date': '2022-06-02' //sigh
      };
      await mockAppDatabase!.database.insert(kTableName, tJsonNote);
      await mockAppDatabase!.database.update(
          kTableName,
          tNewNoteValues,
          where: 'id = 1',
      );
      final expectedList = [tNewJsonNote];
      final result = await mockAppDatabase!.database.query(kTableName);
      expect(result, expectedList);
    });
  });

}
