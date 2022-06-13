// ignore_for_file: cascade_invocations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/core/di/injection.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/home/widgets/note_filter_options.dart';
import 'package:visual_notes/features/presentation/home/widgets/note_list_tile.dart';
import 'package:visual_notes/features/presentation/save_note/view/save_note_page.dart';
import 'package:visual_notes/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<HomeBloc>()
          ..add(const GetNotes()),
        child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notesAppBarTitle),
        actions: const [
          NoteFilterOptions()
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) =>
              previous.noteHomeStatus != current.noteHomeStatus,
              listener: (context, state){
                if (state.noteHomeStatus == NoteHomeStatus.failure) {
                  ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content:
                          Text(l10n.notesHomePageErrorSnackbarText +
                              state.errorMessage!,),
                          ),
                      );
                }
              },
          ),
          //undo deletion listener
          BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) =>
                previous.lastDeletedNote != current.lastDeletedNote &&
                current.lastDeletedNote != null,
              listener: (context, state){
                final deletedTodo = state.lastDeletedNote!;
                final messenger = ScaffoldMessenger.of(context);
                messenger
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                          l10n.notesHomePageNoteDeletedSnackbar(
                              deletedTodo.title!,
                          ),
                      ),
                      action: SnackBarAction(
                          label: l10n.notesHomePageUndoDeletion,
                          onPressed: (){
                            context
                                .read<HomeBloc>()
                                .add(const UndoDeletionRequested());
                          },
                      ),
                  ),
                );
              },
          ),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.noteHomeStatus == NoteHomeStatus.loading) {
                return const Center(child: CircularProgressIndicator(),);
              }
            else if (state.noteHomeStatus == NoteHomeStatus.success) {
              if(state.notes!.isEmpty){
                return Center(
                  child: Image.asset('assets/no_notes_list.jpg'),
                );
              }else{
                return CupertinoScrollbar(
                  child: ListView(
                    children: [
                      for(final note in state.filteredNotes)
                        NoteListTile(
                          note: note,
                          onToggleClosed: (isClosed){
                            context
                                .read<HomeBloc>()
                                .add(ClosedToggled(
                              note: note,
                              isClosed: isClosed,
                            ),
                            );
                          },
                          onDismissed: (_){
                            context
                                .read<HomeBloc>()
                                .add(DeleteNote(note: note));
                          },
                          onTab: (){
                            Navigator
                                .of(context)
                                .push(SaveNotePage.rout(initialNote: note),
                            );
                          },
                        )
                    ],
                  ),
                );
              }

              }
            return const SizedBox();

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        key: const Key('home_page_floatingActionButton'),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator
              .of(context)
              .push(SaveNotePage.rout(),
          );
        },
      ),
    );
  }
}
