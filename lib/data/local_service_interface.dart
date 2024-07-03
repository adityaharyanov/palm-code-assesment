import 'package:palm_code_assessment/data/models/book.dart';

abstract class LocalServiceInterface {
  Future toggleFavourite(Book book);
  Future<Map<int, Book>> fetchFavouritebook();
}
