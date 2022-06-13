import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';
import 'package:visual_notes/features/data/database/database_constants.dart';

// i couldn't use Freezed here because of the Floor database entity annotation
// doesn't work with factory constructor

@Entity(tableName: kTableName)
class Note extends Equatable{
  Note({
    String? id,
    this.title,
    this.imageData,
    this.description,
    required this.date,
    this.isClosed = false,
  }) : id = id ?? const Uuid().v4();

  @primaryKey
  final String? id;

  final String? title;
  final String? imageData;
  final String? description;
  final DateTime date;
  final bool isClosed;

  Note copyWith({
    String? id,
    String? title,
    String? imagePath,
    String? description,
    DateTime? date,
    bool? isClosed,
  }){
    return Note(
        id: id ?? this.id,
        title: title ?? this.title,
        imageData: imagePath ?? this.imageData,
        description: description ?? this.description,
        date: date ?? this.date,
        isClosed: isClosed ?? this.isClosed,
    );
  }


  @override
  List<Object?> get props =>
      [id, title, imageData, description, date, isClosed];
}
