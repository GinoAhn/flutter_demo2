import 'package:json_annotation/json_annotation.dart';
import 'BarcodeProperty.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class Property {
  Property({
    this.lineBreak = true,
    this.align = 'AlignLeft',
    this.barcode,
    this.cut,
    this.bold = false,
    this.whDouble = false,});

  Property.fromJson(dynamic json) {
    lineBreak = json['lineBreak'];
    align = json['align'];
    barcode = json['barcode'];
    cut = json['cut'];
    bold = json['bold'];
    whDouble = json['whDouble'];
  }

  bool lineBreak = true;
  String align = 'AlignLeft';
  BarcodeProperty? barcode;
  String? cut;
  bool bold = false;
  bool whDouble = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lineBreak'] = lineBreak;
    map['align'] = align;
    map['barcode'] = barcode;
    map['cut'] = cut;
    map['bold'] = bold;
    map['whDouble'] = whDouble;
    return map;
  }
}