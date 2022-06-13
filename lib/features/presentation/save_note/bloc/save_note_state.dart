part of 'save_note_bloc.dart';

enum SaveNoteStatus{initial, loading, success, failure}

@freezed
class SaveNoteState with _$SaveNoteState {
  const factory SaveNoteState({
    @Default(SaveNoteStatus.initial) SaveNoteStatus status,
    Note? initialNote,
    @Default('') String? title,
    @Default('') String? description,
    @Default('') String? imageData,
    String? errorMessage,
  }) = _SaveNoteState;

  const SaveNoteState._();

  bool get isNewNote => initialNote == null;
}
extension SaveNoteStatusX on SaveNoteStatus{
  bool get isLoadingOrSuccess => [
    SaveNoteStatus.loading,
    SaveNoteStatus.success,
  ].contains(this);

}
