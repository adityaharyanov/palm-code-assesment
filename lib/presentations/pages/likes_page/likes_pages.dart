import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_code_assessment/presentations/pages/likes_page/likes_controller.dart';
import 'package:palm_code_assessment/presentations/widgets/book_item_container.dart';

class LikesPage extends StatelessWidget {
  final LikesController _controller = Get.put(LikesController());
  LikesPage({super.key});

  Widget _buildItem(BuildContext context, int index) {
    var item = _controller.items[index];
    return BookItemContainer(
      title: item.title,
      author: item.authors.firstOrNull?.name,
      imageUrl: item.formats["image/jpeg"],
      onTap: () => _controller.onTapItem(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 84,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          child: Obx(() => ListView.separated(
                controller: _controller.scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _controller.items.length,
                itemBuilder: _buildItem,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              )),
        ),
      ),
    );
  }
}
