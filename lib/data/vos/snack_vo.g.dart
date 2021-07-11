// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackVo _$SnackVoFromJson(Map<String, dynamic> json) {
  return SnackVo(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['price'] as num)?.toDouble(),
    (json['unit_price'] as num)?.toDouble(),
    json['image'] as String,
    json['quantity'] as int,
    (json['total_price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SnackVoToJson(SnackVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'unit_price': instance.unitPrice,
      'image': instance.image,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
    };
