import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visual_notes/core/routes/route_generator.dart';
import 'package:visual_notes/l10n/l10n.dart';

extension PumpApp on WidgetTester{
  Future<void> pumpApp(Widget myWidget){
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Scaffold(body: myWidget,),
      ),
    );
  }
  Future<void> pumpRoute(Route<dynamic> route,){
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
    );
  }
}
