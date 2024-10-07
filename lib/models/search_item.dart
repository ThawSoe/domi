import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_item.g.dart';

@JsonSerializable()
class AddressSearchItem extends Equatable {
  @JsonKey(name: "street")
  final String streetName;
  final String city;
  final String id;

  const AddressSearchItem(
    this.streetName,
    this.city,
    this.id,
  );

  factory AddressSearchItem.fromJson(dynamic json) =>
      _$AddressSearchItemFromJson(json);

  Map<String, dynamic> toMap() => _$AddressSearchItemToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
