import 'package:flutter/material.dart';

class BookItemContainer extends StatelessWidget {
  final String title;
  final String? author;
  final String? imageUrl;
  final VoidCallback? onTap;

  const BookItemContainer(
      {super.key,
      required this.title,
      this.author,
      required this.imageUrl,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl ?? "",
              width: 50,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                  const SizedBox(height: 8),
                  Text(author ?? "Unknown Author",
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
