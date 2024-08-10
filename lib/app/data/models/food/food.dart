// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class Food {
  final int id;
  final String name;
  final String desc;
  final String status;
  final String image;
  final List<String> crawlings;
  final List<String>? tips;
  final List<String> tags;

  Food({
    required this.id,
    required this.name,
    required this.desc,
    required this.status,
    this.tips,
    required this.image,
    required this.tags,
    required this.crawlings,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
