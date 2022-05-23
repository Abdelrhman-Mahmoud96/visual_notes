part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent{
  const factory HomeEvent.subscriptionRequested() = SubscriptionRequested;
  const factory HomeEvent.filterChanged({NoteViewFilter? filter})=FilterChanged;
  const factory HomeEvent.deleteNote({required Note note}) = DeleteNote;
  const factory HomeEvent.undoDeletionRequested() = UndoDeletionRequested;
  const factory HomeEvent.completionToggled({
    required Note note, required bool isClosed,}) = CompletionToggled;
}
