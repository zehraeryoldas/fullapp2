import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/feature/home/home_create/home_create_view.dart';
import 'package:fullapp2/feature/home/home_provider.dart';
import 'package:fullapp2/feature/home/sub_view/home_chips.dart';
import 'package:fullapp2/feature/home/sub_view/home_search_Delegate.dart';
import 'package:fullapp2/product/model/tag.dart';
import 'package:fullapp2/product/widget/card/home_news_card.dart';
import 'package:kartal/kartal.dart';

import '../../product/constant/color_constants.dart';
import '../../product/constant/string_constant.dart';
import '../../product/widget/card/recommended.dart';
import '../../product/widget/text/sub_title_text.dart';
import '../../product/widget/text/title_text.dart';

final HomeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeVieww extends ConsumerStatefulWidget {
  const HomeVieww({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewwState();
}

class _HomeViewwState extends ConsumerState<HomeVieww> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      //mikrotask şunu sağlar frame çizildikten sonra call eder.
      ref.read(HomeProvider.notifier).fetchAndLoad();
    });
    ref.read(HomeProvider.notifier).addListener((state) {
      if (state.selectedTag != null) {
        _controller.text = state.selectedTag?.name ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          context.navigateToPage(const HomeCreateView(),
              type: SlideType.BOTTOM);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(children: [
          ListView(
            children: [
              const _Header(),
              _CustomField(_controller),
              const _TagListView(),
              const _BrowseHorixontalListview(),
              const _RecommendedHeader(),
              const RecommendedListView(),
              //  HomeListView()
            ],
          ),
          if (ref.watch(HomeProvider).isLoading ?? false)
            const Center(child: CircularProgressIndicator())
        ]),
      ),
    );
  }
}

class _CustomField extends ConsumerWidget {
  const _CustomField(this.controller);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      onTap: () async {
        final result = await showSearch<Tag?>(
            context: context,
            delegate: HomeSearchDelegate(
                ref.read(HomeProvider.notifier).fullTagList));

        ref.read(HomeProvider.notifier).updateSelectedTag(result);
      },
      decoration: const InputDecoration(
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

class _TagListView extends ConsumerWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagItems = ref.watch(HomeProvider).tag ?? [];
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagItems.length ?? 0,
          itemBuilder: (context, index) {
            final tagitem = tagItems[index];
            if (tagitem.active ?? false) {
              return ActiveChip(
                tag: tagitem,
              );
            }
            return PassiveChip(
              tag: tagitem,
            );
            // if (index.isOdd) {
            //   return const ActiveChip();
            // }
            // return const PassiveChip();
          }),
    );
  }
}

//riverpod olduğu için widgetlarımızı consumera çevirdik
class _BrowseHorixontalListview extends ConsumerWidget {
  const _BrowseHorixontalListview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItem = ref.watch(HomeProvider).news;
    return SizedBox(
      height: context.dynamicHeight(.2),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsItem?.length ?? 0,
          itemBuilder: (context, index) {
            return HomeNewsCard(newsItem: newsItem?[index]);
          }),
    );
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
