import 'package:palm_code_assessment/data/repositories/favourite_repository.dart';
import 'package:palm_code_assessment/domains/models/book.dart';

class FavouriteUsecase {
  final FavouriteRepository _favouriteRepository;

  FavouriteUsecase(this._favouriteRepository);

  Future<void> toggleFavourite(Book item) async {
    await _favouriteRepository.toggleFavourite(item);
  }

  Future<List<Book>> getFavourites() async {
    var result = await _favouriteRepository.getFavourites();
    return result.values.toList();
  }
}
