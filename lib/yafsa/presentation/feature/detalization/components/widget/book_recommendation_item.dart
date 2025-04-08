import 'package:flutter/material.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

class BookRecommendationItem extends StatelessWidget {
  final BookDomainModel book;

  final GestureTapCallback onTap;

  const BookRecommendationItem(
      {super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Set rounded corners here
        ),
        clipBehavior: Clip.antiAlias, // Ensure clipping is applied
        child: AspectRatio(
          aspectRatio: 3 / 4, // Aspect ratio for book cover, adjust as needed
          child: (book.formats["image/jpeg"] ?? "").isNotEmpty
              ? Image.network(
                  book.formats["image/jpeg"] ?? "",
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // Show solid color in case of an error (e.g., image not found)
                    return Container(
                      color: colorScheme
                          .primary, // Solid color if the image fails to load
                    );
                  },
                )
              : Container(
                  color: colorScheme
                      .primary, // Solid color if the image URL is empty
                ),
        ),
      ),
    );
  }
}
