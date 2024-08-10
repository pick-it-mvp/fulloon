// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:juction/app/data/local/enum/user_mode_enum.dart';

part 'user.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class User {
  String id;
  String nickName;
  String? profileImgUrl;
  int age;
  String region;
  String registrationDate;
  String dueDate;
  String childbirth;

  String userMode;

  ///*[dueDate]를 연산한 값으로, 21주,31주와 같이 뜨도록 한다
  int? babyDate;

  User({
    required this.id,
    required this.nickName,
    required this.profileImgUrl,
    required this.age,
    required this.region,
    required this.registrationDate,
    required this.dueDate,
    required this.childbirth,
    required this.userMode,
    this.babyDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromModel(User model) {
    return User(
      id: model.id,
      nickName: model.nickName,
      profileImgUrl: model.profileImgUrl,
      age: model.age,
      region: model.region,
      registrationDate: model.registrationDate,
      dueDate: model.dueDate,
      childbirth: model.childbirth,
      userMode: model.userMode,
      babyDate: getBabyDate(model),
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static int? getBabyDate(User user) {
    if (user.userMode == UserModeEnum.embryo.name) {
      var duration = DateTime.now().difference(DateTime.parse(user.dueDate));
      return duration.inDays ~/ 7;
    }
    return null;
  }
}
