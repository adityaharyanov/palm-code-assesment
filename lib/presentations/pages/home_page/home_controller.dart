import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_code_assessment/domains/models/book.dart';
import 'package:palm_code_assessment/domains/usecase/book_usecase.dart';
import 'package:palm_code_assessment/presentations/routes/route.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends GetxController {
  final BookUseCase _bookUseCase = Get.find<BookUseCase>();
  final scrollController = ScrollController();

  RxBool isLoading = false.obs;
  RxBool isEndScrollLoading = false.obs;
  int page = 1;
  int nextPage = 1;
  final searchQuery = "".obs;
  final RxList<Book> items = <Book>[].obs;
  final RxList<Book> filteredItems = <Book>[].obs;

  BookPage? books;

  HomeController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(_scrollListener);
    searchQuery.stream
        .debounceTime(const Duration(milliseconds: 700))
        .listen((String text) async {
      _searchBook(text);
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _initLoad();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.removeListener(_scrollListener);
  }

  void _initLoad() async {
    try {
      if (isLoading.value) return;
      isLoading.value = true;
      await _loadPage(page: 1);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  void _scrollLoad() async {
    try {
      if (isEndScrollLoading.value) return;

      isEndScrollLoading.value = true;

      await _loadPage();

      isEndScrollLoading.value = false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _loadPage({int? page}) async {
    if (page != null) {
      nextPage = page;
    }

    page = nextPage;
    books = await _bookUseCase.getBooks(page: page);

    if (page == 1) {
      items.clear();
    }

    nextPage = books?.next != null ? int.parse(books!.next!.split("=")[1]) : 1;
    items.addAll(books?.results ?? []);
  }

  Future<void> _searchBook(String query) async {
    if (query.isEmpty) {
      filteredItems.clear();
      items.clear();
      items.addAll(books?.results ?? []);
      return;
    }

    filteredItems.clear();
    filteredItems.addAll(items.where((element) {
      return element.title.toLowerCase().contains(query.toLowerCase());
    }));

    items.clear();
    items.addAll(filteredItems);
  }

  void onTapItem(Book item) {
    Get.toNamed(RouteName.detail.path, arguments: item.id);
  }

  void onTapFavourite() {
    Get.toNamed(RouteName.likes.path);
  }

  void onSearchQueryChanged(String query) {
    searchQuery.value = query;
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200) {
      if (!isEndScrollLoading.value) {
        _scrollLoad();
      }
    } else {
      if (isEndScrollLoading.value) {
        isEndScrollLoading.value = false;
      }
    }
  }
}
