import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/header_detalization.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(children: [
      DetalizationHeader(
        title: "",
        isSelected: false,
        onFavouritePressed: () {},
        onNavigationPressed: () {
          GoRouter.of(context).pop();
        },
        detalizationController: DetalizationController(),
      ),
      Expanded(
          flex: 1,
          child: Shimmer.fromColors(
            baseColor: colorScheme.onSurface,
            highlightColor: colorScheme.surface,
            child: ListView.builder(
              itemCount: 3, // Adjust the count based on your needs
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: ShimmerBookItem());
              },
            ),
          ))
    ]);
  }
}

class ShimmerBookItem extends StatelessWidget {
  const ShimmerBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 150,
                  width: 100,
                  color: Colors.white,
                )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 16,
                          width: 200,
                          color: Colors.white,
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 16,
                          width: 100,
                          color: Colors.white,
                        ))),
              ],
            ))
          ],
        ));
  }
}
