import 'package:flutter/material.dart';
import 'package:fullapp2/product/constant/index.dart';
import 'package:fullapp2/product/enum/widget_size.dart';
import 'package:fullapp2/product/model/category.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';
import 'package:fullapp2/product/utility/firebase/firebase_utilty.dart';
import 'package:kartal/kartal.dart';

class HomeCreateView extends StatefulWidget {
  const HomeCreateView({super.key});

  @override
  State<HomeCreateView> createState() => _HomeCreateViewState();
}

class _HomeCreateViewState extends State<HomeCreateView> with FirebaseUtility {
  List<CategoryModel> category = [];
  CategoryModel? selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchInitialCategory();
  }

  Future<void> _fetchInitialCategory() async {
    final response = await fetchList<CategoryModel, CategoryModel>(
        CategoryModel(), FirebaseCollections.category);

    setState(() {
      category = response ?? [];
    });
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
      body: Form(
        child: Padding(
          padding: context.padding.low,
          child: ListView(
            children: [
              // TextFormField(
              //   decoration: const InputDecoration(
              //       hintText: "Category", border: OutlineInputBorder()),
              // ),
              DropdownButtonFormField<CategoryModel>(
                  items: category.map((e) {
                    return DropdownMenuItem<CategoryModel>(
                        value: e, child: Text(e.name ?? ''));
                  }).toList(),
                  value: selectedCategory,
                  hint: const Text("Select Category"),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              context.emptySizedHeightBoxLow,
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "title", border: OutlineInputBorder()),
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: context.dynamicHeight(0.2),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstants.grayPrimary)))),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text("Save"),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(
                        WidgetSize.buttonNormal.value.toDouble())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
