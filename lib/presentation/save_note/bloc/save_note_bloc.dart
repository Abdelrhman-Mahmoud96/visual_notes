import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/domain/entities/note.dart';
import 'package:visual_notes/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/domain/use_cases/use_case_update_note.dart';

part 'save_note_event.dart';
part 'save_note_state.dart';
part 'save_note_bloc.freezed.dart';

class SaveNoteBloc extends Bloc<SaveNoteEvent, SaveNoteState> {
  SaveNoteBloc({
    required this.useCaseAddNote,
    required this.useCaseUpdateNote,
    this.initialNote,
  }) : super(SaveNoteState(
    initialNote: initialNote,
    title: initialNote?.title ?? '',
    description: initialNote?.description ?? '',
    imagePath: initialNote?.imagePath ?? '',
  ),)

   {
    on<LoadCurrentNote>(_onLoadCurrentNote);
    on<TitleChanged>(_onTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<ImageChanged>(_onImageChanged);
    on<NoteSubmitted>(_onNoteSubmitted);
  }

  final UseCaseAddNote? useCaseAddNote;
  final UseCaseUpdateNote? useCaseUpdateNote;
  final Note? initialNote;

  void _onTitleChanged(TitleChanged event, Emitter<SaveNoteState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChanged(DescriptionChanged event,
      Emitter<SaveNoteState> emit,) {
    emit(state.copyWith(description: event.description));
  }

  void _onImageChanged(ImageChanged event, Emitter<SaveNoteState> emit) {
    emit(state.copyWith(imagePath: event.imagePath,),);
  }

  Future<void> _onNoteSubmitted(NoteSubmitted event,
      Emitter<SaveNoteState> emit,) async{
    emit(state.copyWith(status: SaveNoteStatus.loading));

    final newNote = (state.initialNote ?? Note(date: DateTime.now())).copyWith(
      title: state.title,
      description: state.description,
      imagePath: state.imagePath,
    );

    try{
      if(state.isNewNote){
        await useCaseAddNote!(newNote);
      }
      else{
        await useCaseUpdateNote!(newNote);
      }
      emit(state.copyWith(status: SaveNoteStatus.success,));
    }
    catch(error){
      emit(state.copyWith(status: SaveNoteStatus.failure,));
    }

  }

  void _onLoadCurrentNote(LoadCurrentNote event, Emitter<SaveNoteState> emit,) {
    emit(state.copyWith(
      initialNote: event.note,
      title: event.note?.title ?? '',
      description: event.note?.description ?? '',
      imagePath: event.note?.imagePath ?? '',
    ),);
  }
}
