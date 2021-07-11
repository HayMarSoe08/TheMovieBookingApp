
import 'package:json_annotation/json_annotation.dart';
import 'package:student_movie_app/data/vos/timeslots_vo.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVo {

  @JsonKey(name: "cinema_id")
  int cinemaId;

  @JsonKey(name: "cinema")
  String cinema;

  @JsonKey(name: "timeslots")
  List<TimeslotsVo> timeslots;

  CinemaVo(this.cinemaId, this.cinema, this.timeslots);

  factory CinemaVo.fromJson(Map<String, dynamic> json) => _$CinemaVoFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaVoToJson(this);
}