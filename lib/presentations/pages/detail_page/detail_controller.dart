import 'package:get/get.dart';
import 'package:palm_code_assessment/domains/models/book.dart';
import 'package:palm_code_assessment/domains/usecase/book_usecase.dart';
import 'package:palm_code_assessment/domains/usecase/favourite_usecase.dart';

class DetailController extends GetxController {
  final BookUseCase _bookUseCase = Get.find<BookUseCase>();
  final FavouriteUsecase _favouriteUseCase = Get.find<FavouriteUsecase>();

  Book? _model;

  RxBool isLoading = false.obs;
  Rx<String?> image = Rx(null);
  Rx<String?> authorName = Rx(null);
  Rx<String?> title = Rx(null);
  RxBool isFavourite = false.obs;

  DetailController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _load();
  }

  void _load() async {
    try {
      if (isLoading.value) return;
      isLoading.value = true;
      var id = Get.arguments as int;

      var result = await _bookUseCase.getBookById(id: id);

      _model = result;
      image.value = result?.formats["image/jpeg"];
      title.value = result?.title;
      authorName.value = result?.authors[0].name;
      isFavourite.value = result?.isFavourite ?? false;

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  void onTapFavourite() {
    _favouriteUseCase.toggleFavourite(_model!);
    isFavourite.toggle();
  }
}
