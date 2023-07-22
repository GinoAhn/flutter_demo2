import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class PrintRequest {
  PrintRequest({
    this.type = -1,
    this.action = "",
    this.posId = "",
    this.data = "",});

  PrintRequest.fromJson(dynamic json) {
    type = json['type'];
    action = json['action'];
    posId = json['posId'];
    data = json['data'];
  }
  int type = 14;
  String action = "";
  String posId = "";
  String data = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['action'] = action;
    map['posId'] = posId;
    map['data'] = data;
    return map;
  }
}