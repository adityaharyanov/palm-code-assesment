import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_code_assessment/presentations/pages/detail_page/detail_controller.dart';

class DetailPage extends StatelessWidget {
  final DetailController _controller = Get.put(DetailController());
  DetailPage({super.key});

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.indigoAccent,
        ),
        child: Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BoxConstraints constraints) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: constraints.maxHeight * 0.3,
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      leading: _buildBackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: Obx(
          () {
            if (_controller.image.value != null) {
              return Image.network(
                _controller.image.value!,
                fit: BoxFit.fitHeight,
                height: constraints.maxHeight * 0.3,
              );
            } else {
              return SizedBox(
                height: constraints.maxHeight * 0.3,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    _controller.title.value ?? "",
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(
                    _controller.authorName.value ?? "",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Obx(
            () => IconButton.filled(
              icon: Icon(
                _controller.isFavourite.value
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 35,
                color: Colors.red,
              ),
              onPressed: _controller.onTapFavourite,
            ),
          ),
        ],
      ),
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
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    _buildAppBar(constraints),
                  ];
                },
                body: Scaffold(
                  body: Container(
                    child: Column(
                      children: [
                        _buildSection(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }
    });
  }
}
