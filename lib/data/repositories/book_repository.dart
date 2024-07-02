import 'package:palm_code_assessment/data/api_service_interface.dart';
import 'package:palm_code_assessment/data/models/book.dart';

class BookRepository {
  final ApiServiceInterface _apiService;

  BookRepository(ApiServiceInterface apiService) : _apiService = apiService;

  Future<Books?> getBooks() async {
    final response = await _apiService.get<Response>("/books");

    if (response == null) {
      return null;
    }
    return Books.fromJson(response);
  }
}
