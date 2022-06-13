import 'package:flutter/material.dart';
import 'package:visual_notes/features/presentation/home/view/home_page.dart';
import 'package:visual_notes/features/presentation/save_note/view/save_note_page.dart';

class RouteGenerator{
  RouteGenerator._();

  static const homePage = '/';
  static const saveNotePage = '/save_note';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case homePage:
        return MaterialPageRoute<void>(
            builder: (_) => const HomePage(),
        );
      case saveNotePage:
        return MaterialPageRoute<void>(
            builder: (_) => const SaveNotePage(),
        );

      default:
        throw const FormatException('Route Not Found');
    }
  }
}
