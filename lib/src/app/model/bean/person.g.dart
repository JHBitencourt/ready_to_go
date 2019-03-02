// GENERATED CODE - DO NOT MODIFY BY HAND

part of person;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person()
    ..apiUrl = json['apiUrl'] as String
    ..name = json['name'] as String
    ..lastName = json['lastName'] as String
    ..github = json['github'] as String
    ..twitter = json['twitter'] as String
    ..website = json['website'] as String;
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'name': instance.name,
      'lastName': instance.lastName,
      'github': instance.github,
      'twitter': instance.twitter,
      'website': instance.website
    };
