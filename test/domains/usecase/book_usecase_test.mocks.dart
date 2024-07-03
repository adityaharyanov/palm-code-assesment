// Mocks generated by Mockito 5.4.4 from annotations
// in palm_code_assessment/test/domains/usecase/book_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:palm_code_assessment/data/models/book.dart' as _i4;
import 'package:palm_code_assessment/data/repositories/book_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BookRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBookRepository extends _i1.Mock implements _i2.BookRepository {
  @override
  _i3.Future<_i4.Books?> fetchBooks() => (super.noSuchMethod(
        Invocation.method(
          #fetchBooks,
          [],
        ),
        returnValue: _i3.Future<_i4.Books?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.Books?>.value(),
      ) as _i3.Future<_i4.Books?>);

  @override
  _i3.Future<_i4.Book?> fetchBook({required int? id}) => (super.noSuchMethod(
        Invocation.method(
          #fetchBook,
          [],
          {#id: id},
        ),
        returnValue: _i3.Future<_i4.Book?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.Book?>.value(),
      ) as _i3.Future<_i4.Book?>);

  @override
  _i3.Future<_i4.Books?> searchBooks({required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchBooks,
          [],
          {#query: query},
        ),
        returnValue: _i3.Future<_i4.Books?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.Books?>.value(),
      ) as _i3.Future<_i4.Books?>);
}