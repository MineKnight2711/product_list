// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
