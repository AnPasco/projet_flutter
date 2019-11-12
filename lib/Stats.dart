import 'package:json_annotation/json_annotation.dart';

part 'Stats.g.dart';

@JsonSerializable()
class Stat {
  int tipCount;
  int usersCount;

  Stat(this.tipCount, this.usersCount);

  static fromJson(Map<String,dynamic > json) {}
}
