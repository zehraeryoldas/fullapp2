import 'package:flutter/material.dart';
import 'package:fullapp2/product/constant/index.dart';
import 'package:fullapp2/product/model/category.dart';
import 'package:kartal/kartal.dart';

class HomeCreateView extends StatefulWidget {
  const HomeCreateView({super.key});

  @override
  State<HomeCreateView> createState() => _HomeCreateViewState();
}

class _HomeCreateViewState extends State<HomeCreateView> {
  final List<CategoryModel> category = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "add new item",
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: context.padding.low,
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                  hintText: "Category", border: OutlineInputBorder()),
            ),
            context.emptySizedHeightBoxLow,
            const TextField(
              decoration: InputDecoration(
                  hintText: "title", border: OutlineInputBorder()),
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorConstants.grayPrimary)))),
            )
          ],
        ),
      ),
    );
  }
}
