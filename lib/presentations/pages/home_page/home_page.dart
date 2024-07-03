import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_code_assessment/presentations/pages/home_page/home_controller.dart';
import 'package:palm_code_assessment/presentations/widgets/book_item_container.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  HomePage({super.key});

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: _controller.onSearchQueryChanged,
              autocorrect: false,
              onTapOutside: (event) {
                FocusScope.of(Get.context!).unfocus();
              },
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color: Colors.pink),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: _controller.onTapFavourite,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                textDirection: TextDirection.rtl,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var item = _controller.items[index];
    if (index == _controller.items.length) {
      return Visibility(
        visible: _controller.isEndScrollLoading.value,
        child: Center(
            child: Container(
          child: const CircularProgressIndicator(),
        )),
      );
    }
    return BookItemContainer(
      title: item.title,
      author: item.authors.firstOrNull?.name,
      imageUrl: item.formats["image/jpeg"],
      onTap: () => _controller.onTapItem(item),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isLoading.value) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigoAccent,
            ),
            body: _buildLoading());
      } else {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.indigoAccent,
            toolbarHeight: 84,
            flexibleSpace: SafeArea(child: _buildSearchField()),
          ),
          body: SafeArea(
            child: Container(
              color: Colors.grey.shade200,
              child: Obx(
                () => ListView.separated(
                  controller: _controller.scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _controller.items.length,
                  itemBuilder: _buildItem,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
