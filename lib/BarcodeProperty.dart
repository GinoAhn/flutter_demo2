import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake)
class BarcodeProperty {
  BarcodeProperty({
    this.frontSpace = 0,
    this.barcodePDF417 = false,
    this.barcodeQR = false,
    this.barcodeCode128 = false,});

  BarcodeProperty.fromJson(dynamic json) {
    frontSpace = json['frontSpace'];
    barcodePDF417 = json['barcodePDF417'];
    barcodeQR = json['barcodeQR'];
    barcodeCode128 = json['barcodeCode128'];
  }

  int frontSpace = 0;
  bool barcodePDF417 = false; //PDF417
  bool barcodeQR = false; //QR
  bool barcodeCode128 = false; //1D

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['frontSpace'] = frontSpace;
    map['barcodePDF417'] = barcodePDF417;
    map['barcodeQR'] = barcodeQR;
    map['barcodeCode128'] = barcodeCode128;
    return map;
  }
}