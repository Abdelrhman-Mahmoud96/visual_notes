part of 'home_bloc.dart';

enum NoteHomeStatus {initial, loading, success, failure}

@freezed
class HomeState with _$HomeState{
  const factory HomeState({
    @Default(NoteHomeStatus.initial) NoteHomeStatus? noteHomeStatus,
    @Default(<Note>[]) List<Note>? notes,
    @Default(NoteViewFilter.all) NoteViewFilter? noteViewFilter,
    Note? lastDeletedNote,
    @Default('') String? errorMessage,
  }) = _HomeState;

  const HomeState._();

  Iterable<Note> get filteredNotes => noteViewFilter!.applyToAll(notes!);
}
