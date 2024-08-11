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
  final List<Map> crawlings;
  final List<String>? tips;
  final List<String> tags;
  final CategoryImg? category;

  Food({
    required this.id,
    required this.name,
    required this.desc,
    required this.status,
    this.tips,
    required this.category,
    required this.image,
    required this.tags,
    required this.crawlings,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

@JsonSerializable()
class CategoryImg {
  final String image;

  CategoryImg({
    required this.image,
  });

  factory CategoryImg.fromJson(Map<String, dynamic> json) =>
      _$CategoryImgFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImgToJson(this);
}
