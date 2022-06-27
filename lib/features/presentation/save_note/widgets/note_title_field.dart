import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';
import 'package:visual_notes/l10n/l10n.dart';

class NoteTitleField extends StatelessWidget {
  const NoteTitleField({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<SaveNoteBloc>().state;
    final hintText = state.initialNote?.title ?? '';

    return FormBuilderTextField(
      // autovalidateMode: AutovalidateMode.always,
      name: l10n.saveNoteTitleLabel,
      key: const Key('saveNoteView_title_formBuilderTextField'),
      initialValue: hintText,
      decoration: InputDecoration(
        enabled: !state.saveNoteStatus.isLoadingOrSuccess,
        labelText: l10n.saveNoteTitleLabel,
        hintText: hintText,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(50),
        FormBuilderValidators.match(r'[a-zA-Z0-9\s]'),
      ]),
      onChanged: onChanged,
    );
  }
}
