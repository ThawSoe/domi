// ignore_for_file: implementation_imports

import 'package:domi/models/exceptions.dart';
import 'package:domi/models/search_item.dart';
import 'package:domi/services/api_service/api_service.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApiService)
class MockApiService extends ApiService {
  @override
  Future<Either<MException, List<AddressSearchItem>>> getSuggestions(
      String query) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Add more for test
    final fakeDataSet = [
      {"street": "3A Sreet", "city": "Tempa FL", "id": "23434"},
      {"street": "3B Sreet", "city": "Florida US", "id": "23434"},
    ];

    return Right(fakeDataSet
        .where((element) {
          String? e = element["street"];
          return e != null && e.toLowerCase().startsWith(query.toLowerCase());
        })
        .map((e) => AddressSearchItem.fromJson(e))
        .toList());
  }
}
