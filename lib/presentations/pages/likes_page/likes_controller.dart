import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_code_assessment/domains/models/book.dart';
import 'package:palm_code_assessment/domains/usecase/favourite_usecase.dart';
import 'package:palm_code_assessment/presentations/routes/route.dart';

class LikesController extends GetxController {
  final FavouriteUsecase _favouriteUseCase = Get.find<FavouriteUsecase>();
  final scrollController = ScrollController();

  RxBool isLoading = false.obs;

  RxList<Book> items = <Book>[].obs;

  LikesController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _loadPage(page: 1);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.removeListener(_scrollListener);
  }

  void _loadPage({int? page}) async {
    isLoading.value = true;

    var books = await _favouriteUseCase.getFavourites();

    items.clear();
    items.addAll(books);

    isLoading.value = false;
  }

  void onTapItem(Book item) {
    Get.toNamed(RouteName.detail.path, arguments: item.id);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      _loadPage();
    }
  }
}
