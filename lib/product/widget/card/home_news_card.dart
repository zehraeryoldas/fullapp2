import 'package:flutter/material.dart';
import 'package:fullapp2/product/model/news.dart';
import 'package:kartal/kartal.dart';

import '../../constant/color_constants.dart';
import '../../enum/widget_size.dart';
import '../text/title_text.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    super.key,
    required this.newsItem,
  });

  // final String dummyImage;
  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(children: [
      Padding(
        padding: context.padding.onlyRightNormal,
        child: Image.network(
          newsItem!.image ?? '',
          errorBuilder: (context, error, stackTrace) => const Placeholder(),
        ),
      ),
      Positioned.fill(
        child: Padding(
          padding: context.padding.normal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ColorConstants.white,
                    size: ImageSize.iconNormal.value.toDouble(),
                  )),
              const Spacer(),
              Padding(
                padding: context.padding.low,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      value: newsItem!.category ?? '',
                      color: ColorConstants.grayPrimary,
                    ),
                    Text(
                      newsItem!.title ?? '',
                      style: context.textTheme.titleMedium!
                          .copyWith(color: ColorConstants.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
