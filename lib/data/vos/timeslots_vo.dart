
import 'package:json_annotation/json_annotation.dart';

part 'timeslots_vo.g.dart';

@JsonSerializable()
class TimeslotsVo{
  @JsonKey(name: "cinema_day_timeslot_id")
  int cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String startTime;

  bool isSelected;

  TimeslotsVo(this.cinemaDayTimeslotId, this.startTime, this.isSelected);

  factory TimeslotsVo.fromJson(Map<String, dynamic> json) => _$TimeslotsVoFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotsVoToJson(this);
}