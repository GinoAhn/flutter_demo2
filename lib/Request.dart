import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class Request {
  Request({
      this.action = "",
      this.amount = "",
      this.billId = "",
      this.date = "",
      this.time = "",
      this.type = "",});

  Request.fromJson(dynamic json) {
    action = json['action'];
    amount = json['amount'];
    billId = json['bill_id'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
  }
  String action = "";
  String amount = "";
  String billId = "";
  String date = "";
  String time = "";
  String type = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = action;
    map['amount'] = amount;
    map['bill_id'] = billId;
    map['date'] = date;
    map['time'] = time;
    map['type'] = type;
    return map;
  }
}