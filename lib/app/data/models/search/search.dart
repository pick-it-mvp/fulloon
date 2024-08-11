// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class Search {
  int id;
  String? name;

  Search({
    required this.id,
    required this.name,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
