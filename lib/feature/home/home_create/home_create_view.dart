import 'package:flutter/material.dart';
import 'package:fullapp2/feature/home/home_create/home_logic.dart';
import 'package:fullapp2/product/constant/index.dart';
import 'package:fullapp2/product/enum/widget_size.dart';
import 'package:fullapp2/product/model/category.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';
import 'package:fullapp2/product/utility/firebase/firebase_utilty.dart';
import 'package:kartal/kartal.dart';

//HOME VİEW KATMANINDA LOGİC OLMAMALI İŞ OLMAMALI
class HomeCreateView extends StatefulWidget {
  const HomeCreateView({super.key});

  @override
  State<HomeCreateView> createState() => _HomeCreateViewState();
}

//class _HomeCreateViewState extends State<HomeCreateView> with FirebaseUtility {
class _HomeCreateViewState extends State<HomeCreateView> {
  //List<CategoryModel> category = [];
  //CategoryModel? selectedCategory;
  HomeLogic? _homeLogic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchInitialCategory();
    _homeLogic = HomeLogic();
  }

//logiclerimi logic sayfasında yazmalıyım
  // Future<void> _fetchInitialCategory() async {
  //   final response = await fetchList<CategoryModel, CategoryModel>(
  //       CategoryModel(), FirebaseCollections.category);

  //   setState(() {
  //     category = response ?? [];
  //   });
  // }

  //yorum satırına alınan fonksiyonun sadeleştirilmiş halidir
  Future<void> _fetchInitialCategory() async {
    await _homeLogic?.fetchAllCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringContants.formAppbarTitle,
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

              // DropdownButtonFormField<CategoryModel>(
              //     items: category.map((e) {
              //       return DropdownMenuItem<CategoryModel>(
              //           value: e,
              //           child: Text(
              //             e.name ?? '',
              //             style: const TextStyle(color: Colors.red),
              //           ));
              //     }).toList(),
              //     value: selectedCategory,
              //     hint: const Text("Select Category"),
              //     onChanged: (value) {
              //       setState(() {
              //         selectedCategory = value;
              //         print(selectedCategory);
              //       });
              //     }),

              _HomeDropdownButton(
                selectedCategory: _homeLogic!.updateCategory,
                category: _homeLogic!.categories,
              ),
              context.emptySizedHeightBoxLow,
              TextFormField(
                decoration: const InputDecoration(
                    hintText: StringContants.hinText,
                    border: OutlineInputBorder()),
              ),
              InkWell(
                onTap: () async {
                  await _homeLogic?.imagePick();
                },
                child: Padding(
                  padding: context.padding.low,
                  child: SizedBox(
                      height: context.dynamicHeight(0.2),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorConstants.purpleDark)),
                          child: _homeLogic?.selectedFileBytes != null
                              ? Image.memory(_homeLogic!.selectedFileBytes!)
                              : const Icon(Icons.abc))),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text(StringContants.buttonSave),
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

class _HomeDropdownButton extends StatelessWidget {
  const _HomeDropdownButton(
      {required this.selectedCategory, required this.category});

  final List<CategoryModel> category;
  final ValueSetter<CategoryModel> selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
        items: category.map((e) {
          return DropdownMenuItem<CategoryModel>(
              value: e,
              child: Text(
                e.name ?? '',
                style: const TextStyle(color: Colors.red),
              ));
        }).toList(),
        hint: const Text(StringContants.dropDown),
        onChanged: (value) {
          if (value == null) return;
          selectedCategory.call(value);
        });
  }
}
