import 'package:json_annotation/json_annotation.dart';
part "response_model.g.dart";

@JsonSerializable(explicitToJson: true)
class ResponseModel {
  String? message;
  dynamic data;
  ResponseModel({
    this.message,
    this.data,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
