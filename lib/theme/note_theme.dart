import 'package:flutter/material.dart';
import 'package:visual_notes/theme/note_colors.dart';

class NoteTheme{
  static ThemeData get light{
    return ThemeData(
      primaryColor: NoteColors.visualPrimaryWhite,
      appBarTheme: const AppBarTheme(color: NoteColors.visualBlue,),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: NoteColors.visualPurple,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: NoteColors.visualPrimaryWhite,
        actionTextColor: NoteColors.visualBlue,
        contentTextStyle: TextStyle(color: NoteColors.visualBlue,),
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: NoteColors.visualDarkBlue,
      fontFamily: 'Manrope',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        buttonColor: NoteColors.visualDarkBlue,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get dark{
    return ThemeData(
        primaryColor: NoteColors.visualPrimaryDark,
        appBarTheme: const AppBarTheme(color: NoteColors.visualDarkBlue),
        colorScheme: ColorScheme.fromSwatch(
            accentColor: NoteColors.visualBlue,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: NoteColors.visualPrimaryWhite,
          actionTextColor: NoteColors.visualBlue,
        ),
        toggleableActiveColor: NoteColors.visualPurple,
        fontFamily: 'Manrope',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
          buttonColor: NoteColors.visualPurple,
          textTheme: ButtonTextTheme.primary,
        ),
    );
  }
}
