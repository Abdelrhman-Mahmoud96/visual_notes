import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:visual_notes/core/di/injection.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';
import 'package:visual_notes/features/presentation/save_note/widgets/note_description_field.dart';
import 'package:visual_notes/features/presentation/save_note/widgets/note_image_picker_field.dart';
import 'package:visual_notes/features/presentation/save_note/widgets/note_not_finished_dialoge.dart';
import 'package:visual_notes/features/presentation/save_note/widgets/note_title_field.dart';
import 'package:visual_notes/l10n/l10n.dart';

class SaveNotePage extends StatelessWidget {
  const SaveNotePage({Key? key}) : super(key: key);

  static Route<void> rout({Note? initialNote}){
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (_) => getIt<SaveNoteBloc>(param1: initialNote),
        child: const SaveNotePage(),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveNoteBloc, SaveNoteState>(
      listenWhen: (previous, current) =>
        previous.status != current.status &&
        current.status == SaveNoteStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      child: SaveNoteView(),
    );
  }
}

class SaveNoteView extends StatelessWidget {
  SaveNoteView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = context.select((SaveNoteBloc bloc) =>
      bloc.state.status,);
    final isNewNote = context.select((SaveNoteBloc bloc) =>
      bloc.state.isNewNote,);
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final fabBackgroundColor = floatingActionButtonTheme.backgroundColor ??
        theme.colorScheme.secondary;

    return Scaffold(
        appBar: AppBar(
        title: Text(
            isNewNote
                ? l10n.saveNoteAddAppBarTitle
                : l10n.saveNoteEditAppBarTitle,),
      ),
        body: WillPopScope(
          onWillPop: () => onBackPressed(context),
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      NoteImagePickerField(
                        onChanged: (images) {
                          if (images!.isNotEmpty) {
                            final imageBytes =
                            File(images.first.path.toString())
                                .readAsBytesSync();

                            final image64 = base64Encode(imageBytes);

                            // final imagesPath = images
                            //     .map((dynamic element) =>element.path.toString())
                            //     .toList();

                            context.read<SaveNoteBloc>().add(
                              SaveNoteEvent.imageChanged(
                                imageData: image64,),
                            );
                          }
                          else{
                            context.read<SaveNoteBloc>().add(
                              const SaveNoteEvent.imageChanged(
                                imageData: '',),
                            );
                          }
                        },
                    ),
                      NoteTitleField(onChanged: (title) =>
                          context
                              .read<SaveNoteBloc>()
                              .add(SaveNoteEvent.titleChanged(title: title!)),
                      ),
                      NoteDescriptionField(onChanged: (description) =>
                          context
                              .read<SaveNoteBloc>()
                              .add(
                            SaveNoteEvent
                                .descriptionChanged(description: description!),
                          )
                        ,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: l10n.saveNoteSaveButtonTooltip,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),),
          backgroundColor: status.isLoadingOrSuccess
              ? fabBackgroundColor.withOpacity(0.5)
              : fabBackgroundColor,
          onPressed: status.isLoadingOrSuccess
              ? null
              : () {
            if (_formKey.currentState!.validate()) {
                context
                    .read<SaveNoteBloc>()
                    .add(const NoteSubmitted());
            } 
            else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(l10n.saveNoteFormNotValid)),
                );
              return log('validation error');
            }
          },
          child: status.isLoadingOrSuccess
              ? const CupertinoActivityIndicator()
              : const Icon(Icons.check_rounded),
        ),
    );
  }
}
