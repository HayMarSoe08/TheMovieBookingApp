// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaVo _$CinemaVoFromJson(Map<String, dynamic> json) {
  return CinemaVo(
    json['cinema_id'] as int,
    json['cinema'] as String,
    (json['timeslots'] as List)
        ?.map((e) =>
            e == null ? null : TimeslotsVo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CinemaVoToJson(CinemaVo instance) => <String, dynamic>{
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeslots,
    };
