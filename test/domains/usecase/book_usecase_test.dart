import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/data/models/book.dart' as data;
import 'package:palm_code_assessment/data/repositories/favourite_repository.dart';
import 'package:palm_code_assessment/domains/models/book.dart';
import 'package:palm_code_assessment/domains/usecase/book_usecase.dart';

import 'book_usecase_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<BookRepository>(), MockSpec<FavouriteRepository>()])
(BookUseCase, BookRepository, FavouriteRepository) _prepareSUT() {
  var bookRepository = MockBookRepository();
  var favouriteRepository = MockFavouriteRepository();
  return (
    BookUseCase(bookRepository, favouriteRepository),
    bookRepository,
    favouriteRepository
  );
}

main() {
  group('BookUsecase', () {
    group("getBooks", () {
      test("Should return a list of books", () {
        var sut = _prepareSUT();

        when(sut.$2.fetchBooks()).thenAnswer((_) async => Future.value(books));

        var result = sut.$1.getBooks();

        verify(sut.$2.fetchBooks()).called(1);
        expect(result, isNotNull);
        expect(result, isA<Future<BookPage?>>());
      });
      test("should return null when result not found", () async {
        var sut = _prepareSUT();

        when(sut.$2.fetchBooks()).thenAnswer((_) async => Future.value(null));

        var result = await sut.$1.getBooks();

        verify(sut.$2.fetchBooks()).called(1);
        expect(result, isNull);
      });
    });
    group("getBookById", () {
      test("should return a book", () async {
        var sut = _prepareSUT();

        when(sut.$2.fetchBook(id: 1315))
            .thenAnswer((_) async => Future.value(book));

        var result = await sut.$1.getBookById(id: 1315);

        verify(sut.$2.fetchBook(id: 1315)).called(1);
        expect(result, isNotNull);
        expect(result, isA<Book?>());
      });

      test("should return null when result not found", () async {
        var sut = _prepareSUT();

        when(sut.$2.fetchBook(id: 9999))
            .thenAnswer((_) async => Future.value(null));

        var result = await sut.$1.getBookById(id: 9999);

        verify(sut.$2.fetchBook(id: 9999)).called(1);
        expect(result, isNull);
      });
    });
    group("searchBooks", () {
      test("should return a list of books", () async {
        var sut = _prepareSUT();

        when(sut.$2.searchBooks(query: "Romeo"))
            .thenAnswer((_) async => Future.value(books));

        var result = await sut.$1.searchBooks(query: "Romeo");

        verify(sut.$2.searchBooks(query: "Romeo")).called(1);
        expect(result, isNotNull);
        expect(result, isA<BookPage?>());
      });

      test("should return null when result not found", () async {
        var sut = _prepareSUT();

        when(sut.$2.searchBooks(query: "Romeo"))
            .thenAnswer((_) async => Future.value(null));

        var result = await sut.$1.searchBooks(query: "Romeo");

        verify(sut.$2.searchBooks(query: "Romeo")).called(1);
        expect(result, isNull);
      });
    });
  });
}

data.Author get author => data.Author(
      name: "William Shakespeare",
      birthYear: 1564,
      deathYear: 1616,
    );

data.Book get book => data.Book(
      id: 1,
      title: "title",
      authors: [author],
      subjects: [
        "Conflict of generations -- Drama",
        "Juliet (Fictitious character) -- Drama",
        "Romeo (Fictitious character) -- Drama",
      ],
      languages: [],
      formats: {"application/pdf": "http://example.com"},
      downloadCount: 1,
    );

data.Books get books => data.Books(
      count: 73872,
      next: "https://gutendex.com/books/?page=2",
      previous: null,
      results: [book],
    );
