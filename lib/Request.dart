import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class Request {
  Request({
      this.action = "",
      this.totalAmount = 0,
      this.billId = "",
      this.date = "",
      this.posId = "",
      this.time = "",
      this.cashRoundOffType = 0,
      this.type = 0,});

  Request.fromJson(dynamic json) {
    type = json['type'];
    action = json['action'];
    date = json['date'];
    time = json['time'];
    posId = json['posId'];
    billId = json['billId'];
    totalAmount = json['totalAmount'];
    cashRoundOffType = json['cashRoundOffType'];
  }
  String action = "";
  double totalAmount = 0;
  String billId = "";
  String date = "";
  String posId = "";
  String time = "";
  int type = 0;
  int cashRoundOffType = 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = action;
    map['totalAmount'] = totalAmount;
    map['cashRoundOffType'] = cashRoundOffType;
    map['posId'] = posId;
    map['billId'] = billId;
    map['date'] = date;
    map['time'] = time;
    map['type'] = type;
    return map;
  }
}