import 'package:json_annotation/json_annotation.dart';
import 'Property.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class Chunk {
  Chunk({
    this.string = "",
    this.property});

  Chunk.fromJson(dynamic json) {
    string = json['string'];
    property = json['property'];
  }

  String string = "";
  Property? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['string'] = string;
    map['property'] = property;
    return map;
  }
}