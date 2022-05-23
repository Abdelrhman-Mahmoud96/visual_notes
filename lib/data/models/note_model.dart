import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/domain/entities/note.dart';

part'note_model.g.dart';

//we didn't use freezed here because:
// 1- we can't extend freezed class
// 2- composition doesn't work here because of the Json methods
//    can't convert the the class instance inside the constructor

@immutable
@JsonSerializable()
class NoteModel extends Note{
  NoteModel({
    required String id,
    required String title,
    required String imagePath,
    required String description,
    required DateTime date,
    required bool isClosed,})
      : super(
      id: id,
      title: title,
      imagePath: imagePath,
      description: description,
      date: date,
      isClosed: isClosed,);

  static NoteModel fromDatabase(Map<String, dynamic> data) =>
      _$NoteModelFromJson(data);

  Map<String, dynamic> toDatabase() => _$NoteModelToJson(this);

}
