import 'package:flutter/material.dart';
import 'package:visual_notes/l10n/l10n.dart';
import 'package:visual_notes/theme/note_colors.dart';

Future<bool> onBackPressed(BuildContext context) async{
  final l10n = context.l10n;

  return (await showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          // backgroundColor: NoteColors.visualDarkBlue,
          title: Column(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: NoteColors.visualBlue,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                l10n.saveNoteDialogTitle,
                style: const TextStyle(color: NoteColors.visualBlue),
                ),
              ),
          ],),
          content: Text(
            l10n.saveNoteDialogCancelEditing,
            style: const TextStyle(color: NoteColors.visualBlue),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false) ,
                child: Text(
                  l10n.saveNoteDialogNoButton,
                  style: const TextStyle(
                      color: NoteColors.visualBlue,
                      fontSize: 16,),
                ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true) ,
              child: Text(
                l10n.saveNoteDialogYesButton,
                style: const TextStyle(
                  color: NoteColors.visualBlue,
                  fontSize: 16,),
              ),
            ),
          ],
        );
      },)
  )?? false;
}
