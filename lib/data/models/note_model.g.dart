// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      isClosed: json['isClosed'] as bool,
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'isClosed': instance.isClosed,
    };
