import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/data/models/book.dart' as data;
import 'package:palm_code_assessment/domains/models/book.dart';
import 'package:palm_code_assessment/domains/usecase/book_usecase.dart';

import 'book_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BookRepository>()])
main() {
  group('BookUsecase', () {
    group("getBooks", () {
      test("Should return a list of books", () {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.fetchBooks())
            .thenAnswer((_) async => Future.value(books));

        var result = sut.getBooks();

        verify(bookRepository.fetchBooks()).called(1);
        expect(result, isNotNull);
        expect(result, isA<Future<BookPage?>>());
      });
      test("should return null when result not found", () async {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.fetchBooks())
            .thenAnswer((_) async => Future.value(null));

        var result = await sut.getBooks();

        verify(bookRepository.fetchBooks()).called(1);
        expect(result, isNull);
      });
    });
    group("getBookById", () {
      test("should return a book", () async {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.fetchBook(id: 1315))
            .thenAnswer((_) async => Future.value(book));

        var result = await sut.getBookById(id: 1315);

        verify(bookRepository.fetchBook(id: 1315)).called(1);
        expect(result, isNotNull);
        expect(result, isA<Book?>());
      });

      test("should return null when result not found", () async {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.fetchBook(id: 9999))
            .thenAnswer((_) async => Future.value(null));

        var result = await sut.getBookById(id: 9999);

        verify(bookRepository.fetchBook(id: 9999)).called(1);
        expect(result, isNull);
      });
    });
    group("searchBooks", () {
      test("should return a list of books", () async {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.searchBooks(query: "Romeo"))
            .thenAnswer((_) async => Future.value(books));

        var result = await sut.searchBooks(query: "Romeo");

        verify(bookRepository.searchBooks(query: "Romeo")).called(1);
        expect(result, isNotNull);
        expect(result, isA<BookPage?>());
      });

      test("should return null when result not found", () async {
        var bookRepository = MockBookRepository();
        var sut = BookUseCase(bookRepository);

        when(bookRepository.searchBooks(query: "Romeo"))
            .thenAnswer((_) async => Future.value(null));

        var result = await sut.searchBooks(query: "Romeo");

        verify(bookRepository.searchBooks(query: "Romeo")).called(1);
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
