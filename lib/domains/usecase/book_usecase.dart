import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/domains/models/book.dart';

class BookUseCase {
  final BookRepository _bookRepository;

  BookUseCase(this._bookRepository);

  Future<BookPage?> getBooks() async {
    var result = await _bookRepository.fetchBooks();
    return result?.toDomain();
  }

  Future<Book?> getBookById({required int id}) async {
    var result = await _bookRepository.fetchBook(id: id);
    return result?.toDomain();
  }

  Future<BookPage?> searchBooks({required String query}) async {
    var result = await _bookRepository.searchBooks(query: query);
    return result?.toDomain();
  }
}
