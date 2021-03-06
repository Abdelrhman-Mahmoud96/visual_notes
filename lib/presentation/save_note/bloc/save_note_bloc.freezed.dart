// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'save_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SaveNoteEventTearOff {
  const _$SaveNoteEventTearOff();

  LoadCurrentNote loadCurrentNote({Note? note}) {
    return LoadCurrentNote(
      note: note,
    );
  }

  TitleChanged titleChanged({required String title}) {
    return TitleChanged(
      title: title,
    );
  }

  DescriptionChanged descriptionChanged({required String description}) {
    return DescriptionChanged(
      description: description,
    );
  }

  ImageChanged imageChanged({required String imagePath}) {
    return ImageChanged(
      imagePath: imagePath,
    );
  }

  NoteSubmitted noteSubmitted() {
    return const NoteSubmitted();
  }
}

/// @nodoc
const $SaveNoteEvent = _$SaveNoteEventTearOff();

/// @nodoc
mixin _$SaveNoteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveNoteEventCopyWith<$Res> {
  factory $SaveNoteEventCopyWith(
          SaveNoteEvent value, $Res Function(SaveNoteEvent) then) =
      _$SaveNoteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveNoteEventCopyWithImpl<$Res>
    implements $SaveNoteEventCopyWith<$Res> {
  _$SaveNoteEventCopyWithImpl(this._value, this._then);

  final SaveNoteEvent _value;
  // ignore: unused_field
  final $Res Function(SaveNoteEvent) _then;
}

/// @nodoc
abstract class $LoadCurrentNoteCopyWith<$Res> {
  factory $LoadCurrentNoteCopyWith(
          LoadCurrentNote value, $Res Function(LoadCurrentNote) then) =
      _$LoadCurrentNoteCopyWithImpl<$Res>;
  $Res call({Note? note});
}

/// @nodoc
class _$LoadCurrentNoteCopyWithImpl<$Res>
    extends _$SaveNoteEventCopyWithImpl<$Res>
    implements $LoadCurrentNoteCopyWith<$Res> {
  _$LoadCurrentNoteCopyWithImpl(
      LoadCurrentNote _value, $Res Function(LoadCurrentNote) _then)
      : super(_value, (v) => _then(v as LoadCurrentNote));

  @override
  LoadCurrentNote get _value => super._value as LoadCurrentNote;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(LoadCurrentNote(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
    ));
  }
}

/// @nodoc

class _$LoadCurrentNote implements LoadCurrentNote {
  const _$LoadCurrentNote({this.note});

  @override
  final Note? note;

  @override
  String toString() {
    return 'SaveNoteEvent.loadCurrentNote(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadCurrentNote &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  $LoadCurrentNoteCopyWith<LoadCurrentNote> get copyWith =>
      _$LoadCurrentNoteCopyWithImpl<LoadCurrentNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) {
    return loadCurrentNote(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) {
    return loadCurrentNote?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) {
    if (loadCurrentNote != null) {
      return loadCurrentNote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) {
    return loadCurrentNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) {
    return loadCurrentNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) {
    if (loadCurrentNote != null) {
      return loadCurrentNote(this);
    }
    return orElse();
  }
}

abstract class LoadCurrentNote implements SaveNoteEvent {
  const factory LoadCurrentNote({Note? note}) = _$LoadCurrentNote;

  Note? get note;
  @JsonKey(ignore: true)
  $LoadCurrentNoteCopyWith<LoadCurrentNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleChangedCopyWith<$Res> {
  factory $TitleChangedCopyWith(
          TitleChanged value, $Res Function(TitleChanged) then) =
      _$TitleChangedCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$TitleChangedCopyWithImpl<$Res> extends _$SaveNoteEventCopyWithImpl<$Res>
    implements $TitleChangedCopyWith<$Res> {
  _$TitleChangedCopyWithImpl(
      TitleChanged _value, $Res Function(TitleChanged) _then)
      : super(_value, (v) => _then(v as TitleChanged));

  @override
  TitleChanged get _value => super._value as TitleChanged;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(TitleChanged(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TitleChanged implements TitleChanged {
  const _$TitleChanged({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'SaveNoteEvent.titleChanged(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TitleChanged &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $TitleChangedCopyWith<TitleChanged> get copyWith =>
      _$TitleChangedCopyWithImpl<TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) {
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) {
    return titleChanged?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class TitleChanged implements SaveNoteEvent {
  const factory TitleChanged({required String title}) = _$TitleChanged;

  String get title;
  @JsonKey(ignore: true)
  $TitleChangedCopyWith<TitleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionChangedCopyWith<$Res> {
  factory $DescriptionChangedCopyWith(
          DescriptionChanged value, $Res Function(DescriptionChanged) then) =
      _$DescriptionChangedCopyWithImpl<$Res>;
  $Res call({String description});
}

/// @nodoc
class _$DescriptionChangedCopyWithImpl<$Res>
    extends _$SaveNoteEventCopyWithImpl<$Res>
    implements $DescriptionChangedCopyWith<$Res> {
  _$DescriptionChangedCopyWithImpl(
      DescriptionChanged _value, $Res Function(DescriptionChanged) _then)
      : super(_value, (v) => _then(v as DescriptionChanged));

  @override
  DescriptionChanged get _value => super._value as DescriptionChanged;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(DescriptionChanged(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DescriptionChanged implements DescriptionChanged {
  const _$DescriptionChanged({required this.description});

  @override
  final String description;

  @override
  String toString() {
    return 'SaveNoteEvent.descriptionChanged(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DescriptionChanged &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  $DescriptionChangedCopyWith<DescriptionChanged> get copyWith =>
      _$DescriptionChangedCopyWithImpl<DescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) {
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) {
    return descriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) {
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) {
    return descriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class DescriptionChanged implements SaveNoteEvent {
  const factory DescriptionChanged({required String description}) =
      _$DescriptionChanged;

  String get description;
  @JsonKey(ignore: true)
  $DescriptionChangedCopyWith<DescriptionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageChangedCopyWith<$Res> {
  factory $ImageChangedCopyWith(
          ImageChanged value, $Res Function(ImageChanged) then) =
      _$ImageChangedCopyWithImpl<$Res>;
  $Res call({String imagePath});
}

/// @nodoc
class _$ImageChangedCopyWithImpl<$Res> extends _$SaveNoteEventCopyWithImpl<$Res>
    implements $ImageChangedCopyWith<$Res> {
  _$ImageChangedCopyWithImpl(
      ImageChanged _value, $Res Function(ImageChanged) _then)
      : super(_value, (v) => _then(v as ImageChanged));

  @override
  ImageChanged get _value => super._value as ImageChanged;

  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(ImageChanged(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageChanged implements ImageChanged {
  const _$ImageChanged({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString() {
    return 'SaveNoteEvent.imageChanged(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageChanged &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imagePath));

  @JsonKey(ignore: true)
  @override
  $ImageChangedCopyWith<ImageChanged> get copyWith =>
      _$ImageChangedCopyWithImpl<ImageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) {
    return imageChanged(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) {
    return imageChanged?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) {
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) {
    return imageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class ImageChanged implements SaveNoteEvent {
  const factory ImageChanged({required String imagePath}) = _$ImageChanged;

  String get imagePath;
  @JsonKey(ignore: true)
  $ImageChangedCopyWith<ImageChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteSubmittedCopyWith<$Res> {
  factory $NoteSubmittedCopyWith(
          NoteSubmitted value, $Res Function(NoteSubmitted) then) =
      _$NoteSubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteSubmittedCopyWithImpl<$Res>
    extends _$SaveNoteEventCopyWithImpl<$Res>
    implements $NoteSubmittedCopyWith<$Res> {
  _$NoteSubmittedCopyWithImpl(
      NoteSubmitted _value, $Res Function(NoteSubmitted) _then)
      : super(_value, (v) => _then(v as NoteSubmitted));

  @override
  NoteSubmitted get _value => super._value as NoteSubmitted;
}

/// @nodoc

class _$NoteSubmitted implements NoteSubmitted {
  const _$NoteSubmitted();

  @override
  String toString() {
    return 'SaveNoteEvent.noteSubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoteSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) loadCurrentNote,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(String imagePath) imageChanged,
    required TResult Function() noteSubmitted,
  }) {
    return noteSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
  }) {
    return noteSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? loadCurrentNote,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(String imagePath)? imageChanged,
    TResult Function()? noteSubmitted,
    required TResult orElse(),
  }) {
    if (noteSubmitted != null) {
      return noteSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrentNote value) loadCurrentNote,
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(NoteSubmitted value) noteSubmitted,
  }) {
    return noteSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
  }) {
    return noteSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrentNote value)? loadCurrentNote,
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(NoteSubmitted value)? noteSubmitted,
    required TResult orElse(),
  }) {
    if (noteSubmitted != null) {
      return noteSubmitted(this);
    }
    return orElse();
  }
}

abstract class NoteSubmitted implements SaveNoteEvent {
  const factory NoteSubmitted() = _$NoteSubmitted;
}

/// @nodoc
class _$SaveNoteStateTearOff {
  const _$SaveNoteStateTearOff();

  _SaveNoteState call(
      {SaveNoteStatus status = SaveNoteStatus.initial,
      Note? initialNote,
      String? title,
      String? description,
      String? imagePath}) {
    return _SaveNoteState(
      status: status,
      initialNote: initialNote,
      title: title,
      description: description,
      imagePath: imagePath,
    );
  }
}

/// @nodoc
const $SaveNoteState = _$SaveNoteStateTearOff();

/// @nodoc
mixin _$SaveNoteState {
  SaveNoteStatus get status => throw _privateConstructorUsedError;
  Note? get initialNote => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveNoteStateCopyWith<SaveNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveNoteStateCopyWith<$Res> {
  factory $SaveNoteStateCopyWith(
          SaveNoteState value, $Res Function(SaveNoteState) then) =
      _$SaveNoteStateCopyWithImpl<$Res>;
  $Res call(
      {SaveNoteStatus status,
      Note? initialNote,
      String? title,
      String? description,
      String? imagePath});
}

/// @nodoc
class _$SaveNoteStateCopyWithImpl<$Res>
    implements $SaveNoteStateCopyWith<$Res> {
  _$SaveNoteStateCopyWithImpl(this._value, this._then);

  final SaveNoteState _value;
  // ignore: unused_field
  final $Res Function(SaveNoteState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? initialNote = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SaveNoteStatus,
      initialNote: initialNote == freezed
          ? _value.initialNote
          : initialNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SaveNoteStateCopyWith<$Res>
    implements $SaveNoteStateCopyWith<$Res> {
  factory _$SaveNoteStateCopyWith(
          _SaveNoteState value, $Res Function(_SaveNoteState) then) =
      __$SaveNoteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SaveNoteStatus status,
      Note? initialNote,
      String? title,
      String? description,
      String? imagePath});
}

/// @nodoc
class __$SaveNoteStateCopyWithImpl<$Res>
    extends _$SaveNoteStateCopyWithImpl<$Res>
    implements _$SaveNoteStateCopyWith<$Res> {
  __$SaveNoteStateCopyWithImpl(
      _SaveNoteState _value, $Res Function(_SaveNoteState) _then)
      : super(_value, (v) => _then(v as _SaveNoteState));

  @override
  _SaveNoteState get _value => super._value as _SaveNoteState;

  @override
  $Res call({
    Object? status = freezed,
    Object? initialNote = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_SaveNoteState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SaveNoteStatus,
      initialNote: initialNote == freezed
          ? _value.initialNote
          : initialNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SaveNoteState extends _SaveNoteState {
  const _$_SaveNoteState(
      {this.status = SaveNoteStatus.initial,
      this.initialNote,
      this.title,
      this.description,
      this.imagePath})
      : super._();

  @JsonKey()
  @override
  final SaveNoteStatus status;
  @override
  final Note? initialNote;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'SaveNoteState(status: $status, initialNote: $initialNote, title: $title, description: $description, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveNoteState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.initialNote, initialNote) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(initialNote),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imagePath));

  @JsonKey(ignore: true)
  @override
  _$SaveNoteStateCopyWith<_SaveNoteState> get copyWith =>
      __$SaveNoteStateCopyWithImpl<_SaveNoteState>(this, _$identity);
}

abstract class _SaveNoteState extends SaveNoteState {
  const factory _SaveNoteState(
      {SaveNoteStatus status,
      Note? initialNote,
      String? title,
      String? description,
      String? imagePath}) = _$_SaveNoteState;
  const _SaveNoteState._() : super._();

  @override
  SaveNoteStatus get status;
  @override
  Note? get initialNote;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$SaveNoteStateCopyWith<_SaveNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
