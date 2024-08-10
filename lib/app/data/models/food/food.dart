// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class Food {
  int id;
  String name;
  String desc;
  String imgUrl;
  bool isGood;
  List<String> nutrients;

  Food({
    required this.id,
    required this.name,
    required this.isGood,
    required this.desc,
    required this.imgUrl,
    required this.nutrients,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
