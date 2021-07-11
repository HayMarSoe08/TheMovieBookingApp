import 'package:json_annotation/json_annotation.dart';

part 'snack_vo.g.dart';

@JsonSerializable()
class SnackVo {

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "price")
  double price;

  @JsonKey(name: "unit_price")
  double unitPrice;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "quantity")
  int quantity;

  @JsonKey(name: "total_price")
  double totalPrice;

  SnackVo(this.id, this.name, this.description, this.price, this.unitPrice,
      this.image, this.quantity, this.totalPrice);

  factory SnackVo.fromJson(Map<String, dynamic> json) => _$SnackVoFromJson(json);

  Map<String, dynamic> toJson() => _$SnackVoToJson(this);
}