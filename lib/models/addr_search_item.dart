import 'package:equatable/equatable.dart';

class AddressSearchItem extends Equatable {
  final String id;
  final String streetName;
  final String city;

  const AddressSearchItem(this.id, this.streetName, this.city);

  @override
  List<Object?> get props => [id];
}
