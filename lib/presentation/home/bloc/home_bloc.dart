import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/domain/entities/note.dart';
import 'package:visual_notes/domain/use_cases/use_case.dart';
import 'package:visual_notes/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/domain/use_cases/use_case_delete_note.dart';
import 'package:visual_notes/domain/use_cases/use_case_get_notes.dart';
import 'package:visual_notes/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/presentation/home/utils/filter.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.useCaseGetNotes,
    required this.useCaseDeleteNote,
    required this.useCaseAddNote,
    required this.useCaseUpdateNote,
  }) : super(const HomeState()) {

    on<SubscriptionRequested>(_onSubscriptionRequested);
    on<DeleteNote>(_onDeleteNote);
    on<UndoDeletionRequested>(_onUndoDeletionRequested);
    on<FilterChanged>(_onFilterChanged);
    on<CompletionToggled>(_onCompletionToggled);
  }

  final UseCaseDeleteNote useCaseDeleteNote;
  final UseCaseGetNotes useCaseGetNotes;
  final UseCaseAddNote useCaseAddNote;
  final UseCaseUpdateNote useCaseUpdateNote;


  FutureOr<void> _onSubscriptionRequested(SubscriptionRequested event,
      Emitter<HomeState> emit,) async{
    emit(state.copyWith(noteHomeStatus: NoteHomeStatus.loading));

    await emit.forEach<List<Note>>(
      useCaseGetNotes(NoPrams()),
      onData:(notes) =>
          state.copyWith(noteHomeStatus: NoteHomeStatus.success, notes: notes),
      onError: (_,__) =>
          state.copyWith(noteHomeStatus: NoteHomeStatus.failure),
    );
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<HomeState> emit) async{
    try{
      await useCaseDeleteNote(event.note);
      emit(state.copyWith(lastDeletedNote: event.note));
    }
    catch(e){
      log('something went wrong while deleting: $e');
    }
  }

  Future<void> _onUndoDeletionRequested(UndoDeletionRequested event,
      Emitter<HomeState> emit,) async{
    assert(state.lastDeletedNote != null, 'last deleted note can not be null');
    try {
      final lastDeletedNote = state.lastDeletedNote;
      emit(state.copyWith(lastDeletedNote: null));
      await useCaseAddNote(lastDeletedNote!);
    }catch (e) {
      log('something went wrong while undo deletion: $e');
    }

  }

  void _onFilterChanged(FilterChanged event, Emitter<HomeState> emit){
    emit(state.copyWith(noteViewFilter: event.filter));
  }

  FutureOr<void> _onCompletionToggled(CompletionToggled event,
      Emitter<HomeState> emit,) async{
    try {
      final newNote = event.note.copyWith(isClosed: event.isClosed);
      await useCaseUpdateNote(newNote);
    }catch (e) {
      log('something went wrong while updating status: $e');
    }
  }
}
