import 'package:flutter_test/flutter_test.dart';
import 'package:palm_code_assessment/data/models/book.dart';
import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/packages/dio_package.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DioPackage>()])
main() {
  group("BookRepository", () {
    test("getBooks : when result found then return Books model", () async {
      var apiService = MockDioPackage();
      var sut = BookRepository(apiService);

      when(apiService.get("/books")).thenAnswer((_) async => booksJson);

      var result = await sut.getBooks();

      verify(apiService.get("/books")).called(1);
      expect(result, isNotNull);
      expect(result, isA<Books>());
    });

    test("getBooks : when result not found then return null", () async {
      var apiService = MockDioPackage();
      var sut = BookRepository(apiService);

      when(apiService.get("/books")).thenAnswer((_) async => null);

      var result = await sut.getBooks();

      verify(apiService.get("/books")).called(1);
      expect(result, isNull);
    });
  });
}

Map<String, dynamic> get authorJson => {
      "name": "Shakespeare, William",
      "birth_year": 1564,
      "death_year": 1616,
    };

Map<String, dynamic> get bookJson => {
      "id": 1513,
      "title": "Romeo and Juliet",
      "authors": [authorJson],
      "translators": [],
      "subjects": [
        "Conflict of generations -- Drama",
        "Juliet (Fictitious character) -- Drama",
        "Romeo (Fictitious character) -- Drama",
        "Tragedies",
        "Vendetta -- Drama",
        "Verona (Italy) -- Drama",
        "Youth -- Drama"
      ],
      "bookshelves": [],
      "languages": ["en"],
      "copyright": false,
      "media_type": "Text",
      "formats": {
        "text/html": "https://www.gutenberg.org/ebooks/1513.html.images",
        "application/epub+zip":
            "https://www.gutenberg.org/ebooks/1513.epub3.images",
        "application/x-mobipocket-ebook":
            "https://www.gutenberg.org/ebooks/1513.kf8.images",
        "application/rdf+xml": "https://www.gutenberg.org/ebooks/1513.rdf",
        "image/jpeg":
            "https://www.gutenberg.org/cache/epub/1513/pg1513.cover.medium.jpg",
        "text/plain; charset=us-ascii":
            "https://www.gutenberg.org/ebooks/1513.txt.utf-8",
        "application/octet-stream":
            "https://www.gutenberg.org/cache/epub/1513/pg1513-h.zip"
      },
      "download_count": 77782,
    };

Map<String, dynamic> get booksJson => {
      "count": 73872,
      "next": "https://gutendex.com/books/?page=2",
      "previous": null,
      "results": [bookJson],
    };
