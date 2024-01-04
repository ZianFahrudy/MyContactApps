import 'package:json_annotation/json_annotation.dart';

enum FilterUserEnum {
  @JsonValue('l')
  male,
  @JsonValue('p')
  female,
  @JsonValue('')
  reset,
}
