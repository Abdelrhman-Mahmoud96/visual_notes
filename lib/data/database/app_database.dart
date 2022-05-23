//required for generated file
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:visual_notes/data/database/converters/date_type_converter.dart';
import 'package:visual_notes/data/database/converters/status_type_converters.dart';
import 'package:visual_notes/data/database/dao.dart';
import 'package:visual_notes/data/database/database_constants.dart';
import 'package:visual_notes/domain/entities/note.dart';


part 'app_database.g.dart';


@TypeConverters([StatusTypeConverter, DateTypeConverter])
@Database(version: kVersion, entities: [Note])
abstract class AppDatabase extends FloorDatabase{
  NoteDao get noteDao;
}
