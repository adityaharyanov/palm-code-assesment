import 'package:get/get.dart';
import 'package:palm_code_assessment/data/repositories/book_repository.dart';
import 'package:palm_code_assessment/data/repositories/favourite_repository.dart';
import 'package:palm_code_assessment/domains/usecase/book_usecase.dart';
import 'package:palm_code_assessment/domains/usecase/favourite_usecase.dart';
import 'package:palm_code_assessment/packages/dio_package.dart';
import 'package:palm_code_assessment/packages/shared_preference.dart';

void prepareDependencies() {
  /// Inject Package Layer
  Get.lazyPut(() => DioPackage());
  Get.lazyPut(() => SharedPreferencePackage());

  /// Inject Data Layer
  Get.lazyPut(() => BookRepository(Get.find<DioPackage>()));
  Get.lazyPut(() => FavouriteRepository(Get.find<SharedPreferencePackage>()));

  /// Inject Domain Layer
  Get.lazyPut(
      () => BookUseCase(
          Get.find<BookRepository>(), Get.find<FavouriteRepository>()),
      fenix: true);
  Get.lazyPut(() => FavouriteUsecase(Get.find<FavouriteRepository>()),
      fenix: true);
}
