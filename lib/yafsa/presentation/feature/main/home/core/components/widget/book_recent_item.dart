import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

class BookRecentItem extends StatelessWidget {
  final BookDomainModel book;

  final GestureTapCallback onTap;

  const BookRecentItem({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
        height: 150,
        child: GestureDetector(
            onTap: onTap,
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  book.formats["image/jpeg"] ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: 150,
                      color: Colors.white,
                    );
                  },
                  height: 150,
                  width: 100,
                ),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          maxLines: 1,
                          book.title,
                          style: textTheme.labelLarge,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          maxLines: 1,
                          book.authors.firstOrNull?.name ?? "",
                          style: textTheme.labelMedium,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/icon-download-24.svg',
                              height: 16.0,
                              width: 16.0,
                              color: colorScheme.secondary,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  (book.downloadCount ?? 0).toString(),
                                  style: textTheme.labelMedium,
                                )),
                          ]),
                    )
                  ]))
            ])));
  }
}
