import 'package:palm_code_assessment/data/local_service_interface.dart';
import 'package:palm_code_assessment/domains/models/book.dart' as domains;
import 'package:palm_code_assessment/data/models/book.dart';

class FavouriteRepository {
  final LocalServiceInterface _sharedPreferencePackage;
  Map<int, Book> favourited = {};

  FavouriteRepository(LocalServiceInterface sharedPreferencePackage)
      : _sharedPreferencePackage = sharedPreferencePackage;

  Future<void> toggleFavourite(domains.Book item) async {
    return _sharedPreferencePackage.toggleFavourite(Book.fromDomain(item));
  }

  Future<Map<int, domains.Book>> getFavourites() async {
    var data = await _sharedPreferencePackage.fetchFavouritebook();

    return data.map((key, value) {
      return MapEntry(key, value.toDomain());
    });
  }
}
