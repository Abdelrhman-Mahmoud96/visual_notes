import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';

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
    imageData: initialNote?.imageData ?? '',
  ),)

   {
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
    emit(state.copyWith(imageData: event.imageData,),);
  }

  Future<void> _onNoteSubmitted(NoteSubmitted event,
      Emitter<SaveNoteState> emit,) async{
    emit(state.copyWith(saveNoteStatus: SaveNoteStatus.loading));

    final newNote = (state.initialNote ?? Note(date: DateTime.now())).copyWith(
      title: state.title,
      description: state.description,
      imagePath: state.imageData,
    );

      if(state.isNewNote){
        final result = await useCaseAddNote!(newNote);
        result.fold(
                (failure) =>
                    emit(state.copyWith(saveNoteStatus: SaveNoteStatus.failure,
                        errorMessage: failure.message,),),
                (success) =>
                    emit(state.copyWith(saveNoteStatus: SaveNoteStatus.success))
        ,);
      }
      else{
        final result = await useCaseUpdateNote!(newNote);
        result.fold(
              (failure) =>
              emit(state.copyWith(saveNoteStatus: SaveNoteStatus.failure,
                errorMessage: failure.message,),),
              (success) =>
              emit(state.copyWith(saveNoteStatus: SaveNoteStatus.success)),
        );
      }
  }


}
