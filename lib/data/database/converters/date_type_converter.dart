import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/data/database/database_constants.dart';

class DateTypeConverter extends TypeConverter<DateTime, String>{
  @override
  DateTime decode(String databaseValue) {
    return DateTime.parse(databaseValue);
  }

  @override
  String encode(DateTime value) {
    return DateFormat(kDateFormat).format(value);
  }

}
