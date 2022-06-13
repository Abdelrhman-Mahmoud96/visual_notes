// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  GetNotes getNotes() {
    return const GetNotes();
  }

  NotesReceived notesReceived({required Either<Failure, List<Note>> result}) {
    return NotesReceived(
      result: result,
    );
  }

  FilterChanged filterChanged({NoteViewFilter? filter}) {
    return FilterChanged(
      filter: filter,
    );
  }

  DeleteNote deleteNote({required Note note}) {
    return DeleteNote(
      note: note,
    );
  }

  UndoDeletionRequested undoDeletionRequested() {
    return const UndoDeletionRequested();
  }

  ClosedToggled closedToggled({required Note note, required bool isClosed}) {
    return ClosedToggled(
      note: note,
      isClosed: isClosed,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class $GetNotesCopyWith<$Res> {
  factory $GetNotesCopyWith(GetNotes value, $Res Function(GetNotes) then) =
      _$GetNotesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetNotesCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $GetNotesCopyWith<$Res> {
  _$GetNotesCopyWithImpl(GetNotes _value, $Res Function(GetNotes) _then)
      : super(_value, (v) => _then(v as GetNotes));

  @override
  GetNotes get _value => super._value as GetNotes;
}

/// @nodoc

class _$GetNotes implements GetNotes {
  const _$GetNotes();

  @override
  String toString() {
    return 'HomeEvent.getNotes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetNotes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return getNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return getNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (getNotes != null) {
      return getNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return getNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return getNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (getNotes != null) {
      return getNotes(this);
    }
    return orElse();
  }
}

abstract class GetNotes implements HomeEvent {
  const factory GetNotes() = _$GetNotes;
}

/// @nodoc
abstract class $NotesReceivedCopyWith<$Res> {
  factory $NotesReceivedCopyWith(
          NotesReceived value, $Res Function(NotesReceived) then) =
      _$NotesReceivedCopyWithImpl<$Res>;
  $Res call({Either<Failure, List<Note>> result});
}

/// @nodoc
class _$NotesReceivedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $NotesReceivedCopyWith<$Res> {
  _$NotesReceivedCopyWithImpl(
      NotesReceived _value, $Res Function(NotesReceived) _then)
      : super(_value, (v) => _then(v as NotesReceived));

  @override
  NotesReceived get _value => super._value as NotesReceived;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(NotesReceived(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<Failure, List<Note>>,
    ));
  }
}

/// @nodoc

class _$NotesReceived implements NotesReceived {
  const _$NotesReceived({required this.result});

  @override
  final Either<Failure, List<Note>> result;

  @override
  String toString() {
    return 'HomeEvent.notesReceived(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotesReceived &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  $NotesReceivedCopyWith<NotesReceived> get copyWith =>
      _$NotesReceivedCopyWithImpl<NotesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return notesReceived(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return notesReceived?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (notesReceived != null) {
      return notesReceived(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return notesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return notesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (notesReceived != null) {
      return notesReceived(this);
    }
    return orElse();
  }
}

abstract class NotesReceived implements HomeEvent {
  const factory NotesReceived({required Either<Failure, List<Note>> result}) =
      _$NotesReceived;

  Either<Failure, List<Note>> get result;
  @JsonKey(ignore: true)
  $NotesReceivedCopyWith<NotesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterChangedCopyWith<$Res> {
  factory $FilterChangedCopyWith(
          FilterChanged value, $Res Function(FilterChanged) then) =
      _$FilterChangedCopyWithImpl<$Res>;
  $Res call({NoteViewFilter? filter});
}

/// @nodoc
class _$FilterChangedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $FilterChangedCopyWith<$Res> {
  _$FilterChangedCopyWithImpl(
      FilterChanged _value, $Res Function(FilterChanged) _then)
      : super(_value, (v) => _then(v as FilterChanged));

  @override
  FilterChanged get _value => super._value as FilterChanged;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(FilterChanged(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as NoteViewFilter?,
    ));
  }
}

/// @nodoc

class _$FilterChanged implements FilterChanged {
  const _$FilterChanged({this.filter});

  @override
  final NoteViewFilter? filter;

  @override
  String toString() {
    return 'HomeEvent.filterChanged(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterChanged &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  $FilterChangedCopyWith<FilterChanged> get copyWith =>
      _$FilterChangedCopyWithImpl<FilterChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return filterChanged(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return filterChanged?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return filterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return filterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(this);
    }
    return orElse();
  }
}

abstract class FilterChanged implements HomeEvent {
  const factory FilterChanged({NoteViewFilter? filter}) = _$FilterChanged;

  NoteViewFilter? get filter;
  @JsonKey(ignore: true)
  $FilterChangedCopyWith<FilterChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteNoteCopyWith<$Res> {
  factory $DeleteNoteCopyWith(
          DeleteNote value, $Res Function(DeleteNote) then) =
      _$DeleteNoteCopyWithImpl<$Res>;
  $Res call({Note note});
}

/// @nodoc
class _$DeleteNoteCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $DeleteNoteCopyWith<$Res> {
  _$DeleteNoteCopyWithImpl(DeleteNote _value, $Res Function(DeleteNote) _then)
      : super(_value, (v) => _then(v as DeleteNote));

  @override
  DeleteNote get _value => super._value as DeleteNote;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(DeleteNote(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }
}

/// @nodoc

class _$DeleteNote implements DeleteNote {
  const _$DeleteNote({required this.note});

  @override
  final Note note;

  @override
  String toString() {
    return 'HomeEvent.deleteNote(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteNote &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  $DeleteNoteCopyWith<DeleteNote> get copyWith =>
      _$DeleteNoteCopyWithImpl<DeleteNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return deleteNote(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return deleteNote?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return deleteNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return deleteNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(this);
    }
    return orElse();
  }
}

abstract class DeleteNote implements HomeEvent {
  const factory DeleteNote({required Note note}) = _$DeleteNote;

  Note get note;
  @JsonKey(ignore: true)
  $DeleteNoteCopyWith<DeleteNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoDeletionRequestedCopyWith<$Res> {
  factory $UndoDeletionRequestedCopyWith(UndoDeletionRequested value,
          $Res Function(UndoDeletionRequested) then) =
      _$UndoDeletionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoDeletionRequestedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements $UndoDeletionRequestedCopyWith<$Res> {
  _$UndoDeletionRequestedCopyWithImpl(
      UndoDeletionRequested _value, $Res Function(UndoDeletionRequested) _then)
      : super(_value, (v) => _then(v as UndoDeletionRequested));

  @override
  UndoDeletionRequested get _value => super._value as UndoDeletionRequested;
}

/// @nodoc

class _$UndoDeletionRequested implements UndoDeletionRequested {
  const _$UndoDeletionRequested();

  @override
  String toString() {
    return 'HomeEvent.undoDeletionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UndoDeletionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return undoDeletionRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return undoDeletionRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (undoDeletionRequested != null) {
      return undoDeletionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return undoDeletionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return undoDeletionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (undoDeletionRequested != null) {
      return undoDeletionRequested(this);
    }
    return orElse();
  }
}

abstract class UndoDeletionRequested implements HomeEvent {
  const factory UndoDeletionRequested() = _$UndoDeletionRequested;
}

/// @nodoc
abstract class $ClosedToggledCopyWith<$Res> {
  factory $ClosedToggledCopyWith(
          ClosedToggled value, $Res Function(ClosedToggled) then) =
      _$ClosedToggledCopyWithImpl<$Res>;
  $Res call({Note note, bool isClosed});
}

/// @nodoc
class _$ClosedToggledCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $ClosedToggledCopyWith<$Res> {
  _$ClosedToggledCopyWithImpl(
      ClosedToggled _value, $Res Function(ClosedToggled) _then)
      : super(_value, (v) => _then(v as ClosedToggled));

  @override
  ClosedToggled get _value => super._value as ClosedToggled;

  @override
  $Res call({
    Object? note = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(ClosedToggled(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ClosedToggled implements ClosedToggled {
  const _$ClosedToggled({required this.note, required this.isClosed});

  @override
  final Note note;
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'HomeEvent.closedToggled(note: $note, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosedToggled &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.isClosed, isClosed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(isClosed));

  @JsonKey(ignore: true)
  @override
  $ClosedToggledCopyWith<ClosedToggled> get copyWith =>
      _$ClosedToggledCopyWithImpl<ClosedToggled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotes,
    required TResult Function(Either<Failure, List<Note>> result) notesReceived,
    required TResult Function(NoteViewFilter? filter) filterChanged,
    required TResult Function(Note note) deleteNote,
    required TResult Function() undoDeletionRequested,
    required TResult Function(Note note, bool isClosed) closedToggled,
  }) {
    return closedToggled(note, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
  }) {
    return closedToggled?.call(note, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotes,
    TResult Function(Either<Failure, List<Note>> result)? notesReceived,
    TResult Function(NoteViewFilter? filter)? filterChanged,
    TResult Function(Note note)? deleteNote,
    TResult Function()? undoDeletionRequested,
    TResult Function(Note note, bool isClosed)? closedToggled,
    required TResult orElse(),
  }) {
    if (closedToggled != null) {
      return closedToggled(note, isClosed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotes value) getNotes,
    required TResult Function(NotesReceived value) notesReceived,
    required TResult Function(FilterChanged value) filterChanged,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(UndoDeletionRequested value)
        undoDeletionRequested,
    required TResult Function(ClosedToggled value) closedToggled,
  }) {
    return closedToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
  }) {
    return closedToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotes value)? getNotes,
    TResult Function(NotesReceived value)? notesReceived,
    TResult Function(FilterChanged value)? filterChanged,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(UndoDeletionRequested value)? undoDeletionRequested,
    TResult Function(ClosedToggled value)? closedToggled,
    required TResult orElse(),
  }) {
    if (closedToggled != null) {
      return closedToggled(this);
    }
    return orElse();
  }
}

abstract class ClosedToggled implements HomeEvent {
  const factory ClosedToggled({required Note note, required bool isClosed}) =
      _$ClosedToggled;

  Note get note;
  bool get isClosed;
  @JsonKey(ignore: true)
  $ClosedToggledCopyWith<ClosedToggled> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {NoteHomeStatus? noteHomeStatus = NoteHomeStatus.initial,
      List<Note>? notes = const <Note>[],
      NoteViewFilter? noteViewFilter = NoteViewFilter.all,
      Note? lastDeletedNote,
      String? errorMessage = ''}) {
    return _HomeState(
      noteHomeStatus: noteHomeStatus,
      notes: notes,
      noteViewFilter: noteViewFilter,
      lastDeletedNote: lastDeletedNote,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  NoteHomeStatus? get noteHomeStatus => throw _privateConstructorUsedError;
  List<Note>? get notes => throw _privateConstructorUsedError;
  NoteViewFilter? get noteViewFilter => throw _privateConstructorUsedError;
  Note? get lastDeletedNote => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {NoteHomeStatus? noteHomeStatus,
      List<Note>? notes,
      NoteViewFilter? noteViewFilter,
      Note? lastDeletedNote,
      String? errorMessage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? noteHomeStatus = freezed,
    Object? notes = freezed,
    Object? noteViewFilter = freezed,
    Object? lastDeletedNote = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      noteHomeStatus: noteHomeStatus == freezed
          ? _value.noteHomeStatus
          : noteHomeStatus // ignore: cast_nullable_to_non_nullable
              as NoteHomeStatus?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      noteViewFilter: noteViewFilter == freezed
          ? _value.noteViewFilter
          : noteViewFilter // ignore: cast_nullable_to_non_nullable
              as NoteViewFilter?,
      lastDeletedNote: lastDeletedNote == freezed
          ? _value.lastDeletedNote
          : lastDeletedNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NoteHomeStatus? noteHomeStatus,
      List<Note>? notes,
      NoteViewFilter? noteViewFilter,
      Note? lastDeletedNote,
      String? errorMessage});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? noteHomeStatus = freezed,
    Object? notes = freezed,
    Object? noteViewFilter = freezed,
    Object? lastDeletedNote = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_HomeState(
      noteHomeStatus: noteHomeStatus == freezed
          ? _value.noteHomeStatus
          : noteHomeStatus // ignore: cast_nullable_to_non_nullable
              as NoteHomeStatus?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      noteViewFilter: noteViewFilter == freezed
          ? _value.noteViewFilter
          : noteViewFilter // ignore: cast_nullable_to_non_nullable
              as NoteViewFilter?,
      lastDeletedNote: lastDeletedNote == freezed
          ? _value.lastDeletedNote
          : lastDeletedNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {this.noteHomeStatus = NoteHomeStatus.initial,
      this.notes = const <Note>[],
      this.noteViewFilter = NoteViewFilter.all,
      this.lastDeletedNote,
      this.errorMessage = ''})
      : super._();

  @JsonKey()
  @override
  final NoteHomeStatus? noteHomeStatus;
  @JsonKey()
  @override
  final List<Note>? notes;
  @JsonKey()
  @override
  final NoteViewFilter? noteViewFilter;
  @override
  final Note? lastDeletedNote;
  @JsonKey()
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(noteHomeStatus: $noteHomeStatus, notes: $notes, noteViewFilter: $noteViewFilter, lastDeletedNote: $lastDeletedNote, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality()
                .equals(other.noteHomeStatus, noteHomeStatus) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality()
                .equals(other.noteViewFilter, noteViewFilter) &&
            const DeepCollectionEquality()
                .equals(other.lastDeletedNote, lastDeletedNote) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(noteHomeStatus),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(noteViewFilter),
      const DeepCollectionEquality().hash(lastDeletedNote),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {NoteHomeStatus? noteHomeStatus,
      List<Note>? notes,
      NoteViewFilter? noteViewFilter,
      Note? lastDeletedNote,
      String? errorMessage}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  NoteHomeStatus? get noteHomeStatus;
  @override
  List<Note>? get notes;
  @override
  NoteViewFilter? get noteViewFilter;
  @override
  Note? get lastDeletedNote;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
