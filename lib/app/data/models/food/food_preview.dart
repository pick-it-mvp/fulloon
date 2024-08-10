// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'food_preview.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class FoodPreview {
  final int id;
  final String name;
  final String image;

  FoodPreview({
    required this.id,
    required this.name,
    required this.image,
  });

  factory FoodPreview.fromJson(Map<String, dynamic> json) => _$FoodPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPreviewToJson(this);
}
