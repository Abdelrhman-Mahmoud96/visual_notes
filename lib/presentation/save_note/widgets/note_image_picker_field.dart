import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:visual_notes/l10n/l10n.dart';
import 'package:visual_notes/presentation/save_note/bloc/save_note_bloc.dart';

class NoteImagePickerField extends StatelessWidget {
  const NoteImagePickerField({Key? key, required this.onChanged})
      : super(key: key);

  final ValueChanged<List<dynamic>?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final screenWidthRatio = MediaQuery.of(context).size.width / 100;
    final screenHeightRatio = MediaQuery.of(context).size.height / 100;
    final state = context.watch<SaveNoteBloc>().state;

    return FormBuilderImagePicker(
      name: 'Photo',
      decoration: InputDecoration(labelText: l10n.saveNoteImagePickerLabel),
      maxWidth: screenWidthRatio * 150,
      maxHeight: screenHeightRatio * 200,
      maxImages: 1,
      imageQuality: 60,
      placeholderImage: const AssetImage('assets/note_no_image.jpg'),
      initialValue: <ImageProvider>[
        if(state.imagePath != null && state.imagePath != '')
            FileImage(File(state.imagePath!)),
      ],

      cameraLabel: Text(l10n.saveNoteImageDialogCamera),
      cameraIcon: const Icon(Icons.camera_alt_outlined),

      galleryLabel: Text(l10n.saveNoteImageDialogGallery),
      galleryIcon: const Icon(Icons.photo_outlined),
      validator: FormBuilderValidators.required(),

      onChanged: onChanged,
    );
  }
}
