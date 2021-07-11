// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslots_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeslotsVo _$TimeslotsVoFromJson(Map<String, dynamic> json) {
  return TimeslotsVo(
    json['cinema_day_timeslot_id'] as int,
    json['start_time'] as String,
    json['isSelected'] as bool,
  );
}

Map<String, dynamic> _$TimeslotsVoToJson(TimeslotsVo instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'isSelected': instance.isSelected,
    };
