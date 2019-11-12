import 'package:json_annotation/json_annotation.dart';

part 'Categories.g.dart';

@JsonSerializable()
class Categories{
  String id;
  String name;
  Categories(this.id, this.name);

  static fromJson(Map<String,dynamic> json) {}
}