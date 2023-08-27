import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/product/model/recommended.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/home/home_vieww.dart';

class RecommendedListView extends ConsumerWidget {
  const RecommendedListView({super.key, this.reco});
  final Recommended? reco;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recItems = ref.watch(HomeProvider).rec ?? [];
    // ignore: unnecessary_null_comparison
    if (recItems == null) return const SizedBox.shrink();

    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: recItems.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var value = recItems[index];
          return Padding(
            padding: context.padding.onlyTopLow,
            child: Row(
              children: [
                Image.network(
                  value.image ?? '',
                  height: 96,
                  errorBuilder: (context, error, stackTrace) =>
                      const Placeholder(),
                ),
                Expanded(
                  child: ListTile(
                    minLeadingWidth: 96,
                    title: Text(value.title ?? ''),
                    subtitle: Text(value.description ?? ''),
                  ),
                )
              ],
            ),
          );
        });
  }
}
