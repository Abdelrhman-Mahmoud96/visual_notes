// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:visual_notes/core/routes/route_generator.dart';
import 'package:visual_notes/features/presentation/home/view/home_page.dart';
import 'package:visual_notes/l10n/l10n.dart';
import 'package:visual_notes/theme/note_theme.dart';


class App extends StatelessWidget {
  const App({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'Visual Notes',
      debugShowCheckedModeBanner: false,
      theme: NoteTheme.light,
      darkTheme: NoteTheme.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const HomePage(),
    );
  }
}
