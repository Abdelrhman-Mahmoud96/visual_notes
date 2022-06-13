part of 'save_note_bloc.dart';

@freezed
class SaveNoteEvent {
  const factory SaveNoteEvent.titleChanged({required String title})
  = TitleChanged;
  const factory SaveNoteEvent.descriptionChanged({required String description})
  = DescriptionChanged;
  const factory SaveNoteEvent.imageChanged({required String imageData})
  = ImageChanged;
  const factory SaveNoteEvent.noteSubmitted()
  = NoteSubmitted;
}
