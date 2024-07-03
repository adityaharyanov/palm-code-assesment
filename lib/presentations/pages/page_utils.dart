import 'package:flutter/material.dart';

class PageUtils {
  final bool isLoading = false;
  final BuildContext context;

  PageUtils.of(this.context);

  void withLoading({required Future<void> Function() action}) async {
    if (isLoading) return;

    showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(0.3),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

    await action();

    Navigator.of(context).pop();
  }
}
