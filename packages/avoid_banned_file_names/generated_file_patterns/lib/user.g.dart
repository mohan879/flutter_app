// ✅ Standard generated file pattern - json_serializable
part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) =>
    User(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
