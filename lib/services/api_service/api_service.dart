import 'package:domi/models/exceptions.dart';
import 'package:domi/models/search_item.dart';
import 'package:domi/services/base_service.dart';
import 'package:either_dart/either.dart';

abstract class ApiService extends BaseService {
  Future<Either<MException, List<AddressSearchItem>>> getSuggestions(
      String query);
}
