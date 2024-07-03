import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_code_assessment/packages/dio_package.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
main() {
  // test("get", () {
  //   var lib = MockDio();
  //   var sut = DioPackage();
  //   sut.dio =
  //   when(lib.get("https://jsonplaceholder.typicode.com/posts/1"))
  //       .thenAnswer((_) async => Response(data: {"id": 1, "title": "foo"}),);

  //   var result = sut.get("https://jsonplaceholder.typicode.com/posts/1");

  //   verify(lib.get("https://jsonplaceholder.typicode.com/posts/1")).called(1);
  //   expect(result, isNotNull);
  //   expect(result, isA<Future<Map<String, dynamic>?>>());
  // });
}
