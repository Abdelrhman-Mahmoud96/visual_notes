import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';
import 'package:visual_notes/l10n/l10n.dart';

class NoteDescriptionField extends StatelessWidget {
  const NoteDescriptionField({Key? key, required this.onChanged}) :
        super(key: key);

  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<SaveNoteBloc>().state;
    final hintText = state.initialNote?.description ?? '';

    return FormBuilderTextField(
      name: l10n.saveNoteDescriptionLabel,
      key: const Key('saveNoteView_description_formBuilderTextField'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: !state.status.isLoadingOrSuccess,
        labelText: l10n.saveNoteDescriptionLabel,
        hintText: hintText,
      ),
      maxLines: 4,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(300),
      ]),
      onChanged: onChanged,
    );
  }
}
