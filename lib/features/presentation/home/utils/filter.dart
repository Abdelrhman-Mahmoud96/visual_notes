import 'package:visual_notes/features/domain/entities/note.dart';

enum NoteViewFilter {all, isOpen, isClosed}

extension NoteViewFilterX on NoteViewFilter{
  bool _apply(Note note){
    switch(this){
      case NoteViewFilter.all:
        return true;
      case NoteViewFilter.isOpen:
        return !note.isClosed;
      case NoteViewFilter.isClosed:
        return note.isClosed;
    }
  }

  Iterable<Note> applyToAll(Iterable<Note> notes) {
    return notes.where(_apply);
  }
}
