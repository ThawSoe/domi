// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSearchItem _$AddressSearchItemFromJson(Map<String, dynamic> json) =>
    AddressSearchItem(
      json['street'] as String,
      json['city'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$AddressSearchItemToJson(AddressSearchItem instance) =>
    <String, dynamic>{
      'street': instance.streetName,
      'city': instance.city,
      'id': instance.id,
    };
