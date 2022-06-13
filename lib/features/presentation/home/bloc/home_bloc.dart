/*for the sake of code consistency i used Either with GetNotes use_case too,
* working with stream is different than future, so we had to add
* a stream listener to subscribe to the stream coming from the repo method,
* and pass the data(Either<Failure, List<Notes>) to a new event called
*"notesReceived" to fold it and get to the Left, Right result.
* we could have kept the old way of using "emit.forEach" provided by
* Bloc package, since it gives the same result, and with less code,
* but using Dartz "either" it helps us handel the errors earlier at
* the repos level, both works and with the same results.
* which one i will keep will be a personal choice if there is no performance
* differences */

import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/core/errors/failure.dart';
import 'package:visual_notes/core/usecases/use_case.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_delete_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_get_notes.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/features/presentation/home/utils/filter.dart';


part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc({
    required this.useCaseGetNotes,
    required this.useCaseDeleteNote,
    required this.useCaseAddNote,
    required this.useCaseUpdateNote,
  }) : super(const HomeState()) {

    on<GetNotes>(_onGetNotes);
    on<NotesReceived>(_onNotesReceived);
    on<DeleteNote>(_onDeleteNote);
    on<UndoDeletionRequested>(_onUndoDeletionRequested);
    on<FilterChanged>(_onFilterChanged);
    on<ClosedToggled>(_onClosedToggled);
  }

  final UseCaseDeleteNote useCaseDeleteNote;
  final UseCaseGetNotes useCaseGetNotes;
  final UseCaseAddNote useCaseAddNote;
  final UseCaseUpdateNote useCaseUpdateNote;
  StreamSubscription<Either<Failure, List<Note>>>? _noteStreamSubscription;

  Future<void> _onGetNotes(GetNotes event,
      Emitter<HomeState> emit,) async{

    emit(state.copyWith(noteHomeStatus: NoteHomeStatus.loading));
    await _noteStreamSubscription?.cancel();

    useCaseGetNotes(const NoParams())
        .listen((result) {
            add(NotesReceived(result: result));
    });
    // await emit.forEach<Either<Failure, List<Note>>>(
    //   useCaseGetNotes(NoParams()),
    //   onData:(notes) =>
    //     state.copyWith(noteHomeStatus: NoteHomeStatus.success, notes: notes),
    //   onError: (_,__) =>
    //       state.copyWith(noteHomeStatus: NoteHomeStatus.failure),
    // );
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<HomeState> emit) async{
    final result = await useCaseDeleteNote(event.note);
    result.fold(
          (failure) => emit(state.copyWith(
        noteHomeStatus: NoteHomeStatus.failure,
        errorMessage: failure.message,),
      ),
          (success) => emit(state.copyWith(lastDeletedNote: event.note)),
    );
  }

  Future<void> _onUndoDeletionRequested(UndoDeletionRequested event,
      Emitter<HomeState> emit,) async{

    assert(state.lastDeletedNote != null, 'last deleted note can not be null');
    final lastDeletedNote = state.lastDeletedNote;
    final result = await useCaseAddNote(lastDeletedNote!);

    result.fold(
          (failure) => emit(state.copyWith(
        noteHomeStatus: NoteHomeStatus.failure,
        errorMessage: failure.message,),
      ),
          (success) => emit(state.copyWith(lastDeletedNote: null)),
    );
  }

  void _onFilterChanged(FilterChanged event, Emitter<HomeState> emit){
    emit(state.copyWith(noteViewFilter: event.filter));
  }

  Future<void> _onClosedToggled(ClosedToggled event,
      Emitter<HomeState> emit,) async{

    final newNote = event.note.copyWith(isClosed: event.isClosed);
    final result = await useCaseUpdateNote(newNote);
    result.fold(
          (failure) => emit(state.copyWith(
        noteHomeStatus: NoteHomeStatus.failure,
        errorMessage: failure.message,),
      ),
          (success) => log('ON_CLOSED_TOGGLE_SUCCESS'),
    );
  }

  void _onNotesReceived(NotesReceived event, Emitter<HomeState> emit) {
    event.result.fold(
            (failure) => emit(state.copyWith(
                noteHomeStatus: NoteHomeStatus.failure,
                errorMessage: failure.message,),),
            (notes) => emit(state.copyWith(
                noteHomeStatus: NoteHomeStatus.success,
                notes: notes,),),
    );
  }

  @override
  Future<void> close() async{
    await _noteStreamSubscription?.cancel();
    return super.close();
  }
}
