import 'package:flutter/material.dart';
import 'package:fullapp2/feature/home/sub_view/home_chips.dart';
import 'package:kartal/kartal.dart';

import '../../product/constant/color_constants.dart';
import '../../product/constant/string_constant.dart';
import '../../product/enum/widget_size.dart';
import '../../product/widget/text/sub_title_text.dart';
import '../../product/widget/text/title_text.dart';

class HomeVieww extends StatelessWidget {
  const HomeVieww({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            _Header(),
            _CustomField(),
            _TagListView(),
            _BrowseHorixontalListview(),
            _RecommendedHeader(),
            _RecommendedListView()
          ],
        ),
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mic_outlined),
        prefixIcon: Icon(Icons.search_off_outlined),
        border: OutlineInputBorder(
            borderSide: BorderSide.none), //çerçeveyi kaldırıyor
        filled: true,
        fillColor: ColorConstants.grayPrimary,
        hintText: StringContants.search,
      ),
    );
  }
}

class _TagListView extends StatelessWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return const ActiveChip();
            }
            return const PassiveChip();
          }),
    );
  }
}

class _BrowseHorixontalListview extends StatelessWidget {
  const _BrowseHorixontalListview();

  static const dummyImage =
      "https://firebasestorage.googleapis.com/v0/b/fullapp-5167d.appspot.com/o/white_house.png?alt=media&token=c454d317-59b9-41a7-9fa3-5396c6a39e4a";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.2),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const _HorizontalCard(dummyImage: dummyImage);
          }),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.dummyImage,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: context.padding.onlyRightNormal,
        child: Image.network(
          _BrowseHorixontalListview.dummyImage,
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
                    const TitleText(
                      value: "Politics",
                      color: ColorConstants.grayPrimary,
                    ),
                    Text(
                      "The lastest situation in the presidential election",
                      style: context.textTheme.titleMedium!
                          .copyWith(color: ColorConstants.purpleDark),
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

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleText(
            value: StringContants.recommended,
            color: ColorConstants.grayPrimary,
          ),
          TextButton(
            onPressed: () {},
            child: const SubTitleText(value: StringContants.seeAll),
          )
        ],
      ),
    );
  }
}

class _RecommendedListView extends StatelessWidget {
  const _RecommendedListView();
  static const dummyImage =
      "https://firebasestorage.googleapis.com/v0/b/fullapp-5167d.appspot.com/o/white_house.png?alt=media&token=c454d317-59b9-41a7-9fa3-5396c6a39e4a";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.onlyTopLow,
            child: Row(
              children: [
                Image.network(
                  _RecommendedListView.dummyImage,
                  height: 96,
                  errorBuilder: (context, error, stackTrace) =>
                      const Placeholder(),
                ),
                const Expanded(
                  child: ListTile(
                    minLeadingWidth: 96,
                    title: Text("UI/UX Design"),
                    subtitle: Text(
                        "A simple trick for creating color palattes quickly"),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          value: StringContants.homeBrowse,
          color: ColorConstants.grayPrimary,
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubTitleText(value: StringContants.homeMessage),
        ),
      ],
    );
  }
}
