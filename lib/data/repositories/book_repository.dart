import 'package:palm_code_assessment/data/api_service_interface.dart';
import 'package:palm_code_assessment/data/models/book.dart';

class BookRepository {
  final ApiServiceInterface _apiService;

  BookRepository(ApiServiceInterface apiService) : _apiService = apiService;

  Future<Books?> fetchBooks() async {
    final response = await _apiService.get<Response>("/books");

    if (response == null) {
      return null;
    }
    return Books.fromJson(response);
  }

  Future<Book?> fetchBook({required int id}) async {
    final response = await _apiService.get<Response>("/books/$id");

    if (response == null) {
      return null;
    }
    return Book.fromJson(response);
  }

  Future<Books?> searchBooks({required String query}) async {
    final response = await _apiService.get<Response>("/books?search=$query");

    if (response == null) {
      return null;
    }
    return Books.fromJson(response);
  }
}
