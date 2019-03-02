library person;

import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {

  String apiUrl;
  String name;
  String lastName;
  String github;
  String twitter;
  String website;

  Person();

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

}