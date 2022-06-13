part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent{
  const factory HomeEvent.getNotes() = GetNotes;
  const factory HomeEvent.notesReceived({
     required Either<Failure, List<Note>> result,}) = NotesReceived;
  const factory HomeEvent.filterChanged({NoteViewFilter? filter})=FilterChanged;
  const factory HomeEvent.deleteNote({required Note note}) = DeleteNote;
  const factory HomeEvent.undoDeletionRequested() = UndoDeletionRequested;
  const factory HomeEvent.closedToggled({
    required Note note, required bool isClosed,}) = ClosedToggled;
}
