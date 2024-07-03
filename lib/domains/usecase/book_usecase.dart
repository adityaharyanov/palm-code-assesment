import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/data/repositories/favourite_repository.dart';
import 'package:palm_code_assessment/domains/models/book.dart';

class BookUseCase {
  final BookRepository _bookRepository;
  final FavouriteRepository _favouriteRepository;

  BookUseCase(this._bookRepository, this._favouriteRepository);

  Future<BookPage?> getBooks({int page = 1, int size = 15}) async {
    var data = await _bookRepository.fetchBooks(page: page, size: size);
    var result = data?.toDomain();

    return result;
  }

  Future<Book?> getBookById({required int id}) async {
    var data = await _bookRepository.fetchBook(id: id);
    var result = data?.toDomain();
    var favourited = await _favouriteRepository.getFavourites();

    if (result != null) {
      if (favourited.containsKey(result.id)) {
        result = result.copyWith(isFavourite: true);
      }
    }
    return result;
  }

  Future<BookPage?> searchBooks({required String query}) async {
    var result = await _bookRepository.searchBooks(query: query);
    return result?.toDomain();
  }
}
