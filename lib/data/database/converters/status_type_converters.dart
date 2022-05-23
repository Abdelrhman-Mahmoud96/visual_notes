import 'package:floor/floor.dart';

class StatusTypeConverter extends TypeConverter<bool, int>{
  @override
  bool decode(int databaseValue) {
    if(databaseValue == 1){
      return true;
    }else{
      return false;
    }
  }

  @override
  int encode(bool value) {
    if(value){
      return 1;
    }else{
      return 0;
    }
  }

}
