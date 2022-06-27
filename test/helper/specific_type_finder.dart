import 'package:flutter_test/flutter_test.dart';

extension ExtraFinder on CommonFinders{
  Finder bySpecificType<T>() => find.byType(T);
}
